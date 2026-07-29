import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:doclock_app/app/data/services/PBE_encryption/encrypted_metadata.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:get/get.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart' as path;
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../data/services/PBE_encryption/checksum_service.dart';
import '../../../../../../data/services/PBE_encryption/encryption_constant.dart';
import '../../../../../../data/services/PBE_encryption/encryption_result.dart';
import '../../../../../../data/services/PBE_encryption/encryption_service.dart';
import '../../../../../../data/services/PBE_encryption/manifest_enkripsi.dart';

import '../../../../../../data/services/PBE_encryption/password_service.dart';
import '../../../../../../data/services/PBE_encryption/storage_service.dart';

class IndexKunciBerkasController extends GetxController {
  final EnkripsiService enkripsiService = EnkripsiService();
  final PenyimpananService penyimpananService = PenyimpananService();
  final ChecksumService checksumService = const ChecksumService();
  final PasswordService sandiService = const PasswordService();
  final encryptedResult = Rxn<EncryptionResult>();
  final selectedPlatformFile = Rxn<PlatformFile>();
  final selectedFile = Rxn<File>();
  final isEncrypting = false.obs;
  final progress = 0.0.obs;
  final fileNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final hintController = TextEditingController();
  final descriptionController = TextEditingController();

  Future<void> pilihBerkas() async {
    final result = await FilePicker.platform.pickFiles(
      withData: false,
    );

    if (result == null) return;

    selectedFile.value = File(
      result.files.single.path!,
    );

    fileNameController.text =
        path.basenameWithoutExtension(result.files.single.name);
  }

  void onFileChanged(PlatformFile? file) {
    if (file == null) {
      selectedPlatformFile.value = null;
      selectedFile.value = null;
      fileNameController.clear();
      return;
    }

    selectedPlatformFile.value = file;
    selectedFile.value = File(file.path!);

    fileNameController.text = path.basenameWithoutExtension(file.name);
  }

  bool validasiDataInput() {
    if (selectedFile.value == null) {
      Get.snackbar(
        "Error",
        "Silakan pilih file.",
      );

      return false;
    }

    if (passwordController.text.length < 8) {
      Get.snackbar(
        "Password",
        "Minimal 8 karakter.",
      );

      return false;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar(
        "Password",
        "Konfirmasi password tidak sama.",
      );

      return false;
    }

    return true;
  }

  bool validasiMetadata(MetadataEnkripsi metadata) {
    if (metadata.algorithm.isEmpty) {
      return false;
    }

    if (metadata.checksum.isEmpty) {
      return false;
    }

    if (metadata.salt.isEmpty) {
      return false;
    }

    if (metadata.nonce.isEmpty) {
      return false;
    }

    if (metadata.mac.isEmpty) {
      return false;
    }

    return true;
  }

  Future<MetadataEnkripsi> buildMetadata({
    required Uint8List originalBytes,
    required Map<String, dynamic> encrypted,
    required List<int> keyBytes,
  }) async {
    return MetadataEnkripsi(
      id: const Uuid().v4(),
      salt: base64Encode(encrypted["salt"]),
      nonce: base64Encode(encrypted["nonce"]),
      mac: base64Encode(encrypted["mac"]),
      originalName: path.basenameWithoutExtension(selectedFile.value!.path),
      originalExtension: path.extension(selectedFile.value!.path),
      originalSize: originalBytes.length,
      hint: hintController.text,
      description: descriptionController.text,
      createdAt: DateTime.now(),
      algorithm: EncryptionConstant.algorithm,
      iteration: EncryptionConstant.pbkdf2Iteration,
      checksum: checksumService.generate(originalBytes),
      formatVersion: EncryptionConstant.formatVersion,
      integrityProtected: true,
      encryptedSize: encrypted["cipher"].length,
      originalFileName: path.basename(selectedFile.value!.path),
      mimeType: lookupMimeType(
            selectedFile.value!.path,
          ) ??
          "application/octet-stream",
      lastModified: await selectedFile.value!.lastModified(),
      readableSize: formatFileSize(
        originalBytes.length,
      ),
      passwordHash: sandiService.hashKey(
        keyBytes,
      ),
    );
  }

  Future<Uint8List> buildArchive({
    required ManifestEnkripsi manifest,
    required MetadataEnkripsi metadata,
    required Map<String, dynamic> encrypted,
  }) async {
    final archive = Archive();

    archive.addFile(
      ArchiveFile.string(
        "manifest.json",
        manifest.encode(),
      ),
    );

    archive.addFile(
      ArchiveFile.string(
        "metadata.json",
        metadata.encode(),
      ),
    );

    archive.addFile(
  ArchiveFile(
    "cipher.bin",
    encrypted["cipher"].length,
    Uint8List.fromList(
      List<int>.from(encrypted["cipher"]),
    ),
  ),
);
    return Uint8List.fromList(
      ZipEncoder().encode(archive),
    );
  }

  Future<File> saveEncryptedFile(Uint8List bytes) async {
    final folder = await penyimpananService.encryptedDirectory();

    final output = File(
      "${folder.path}/${fileNameController.text}.dclock",
    );

    await output.writeAsBytes(bytes);

    return output;
  }

  Future<void> prosesKunciBerkas() async {
    if (!validasiDataInput()) return;

    try {
      isEncrypting.value = true;

      progress.value = 0.1;

      final originalBytes = await selectedFile.value!.readAsBytes();

      progress.value = 0.2;

      final encrypted = await enkripsiService.encrypt(
        bytes: originalBytes,
        password: passwordController.text,
      );

      progress.value = 0.4;

      final keyBytes = await enkripsiService.deriveKeyBytes(
        passwordController.text,
        encrypted["salt"],
      );

      progress.value = 0.5;

      final metadata = await buildMetadata(
        originalBytes: originalBytes,
        encrypted: encrypted,
        keyBytes: keyBytes,
      );

      progress.value = 0.7;

      final manifest = buildManifest();

      final archive = await buildArchive(
        manifest: manifest,
        metadata: metadata,
        encrypted: encrypted,
      );

      progress.value = 0.9;

      final file = await saveEncryptedFile(
        archive,
      );

      encryptedResult.value = EncryptionResult(
        file: file,
        originalName: selectedFile.value!.path.split("/").last,
        encryptedName: path.basename(file.path),
        size: formatFileSize(file.lengthSync()),
        encryptedAt: DateTime.now(),
      );

      progress.value = 1;

      Get.snackbar(
        "Berhasil",
        "File berhasil dienkripsi",
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );
    } finally {
      isEncrypting.value = false;
    }
  }

  Future<void> bukaFile() async {
    if (encryptedResult.value == null) return;

    final result = await OpenFilex.open(
      encryptedResult.value!.file.path,
    );

    print(result.type);
    print(result.message);
  }

  Future<void> shareFile() async {
    if (encryptedResult.value == null) return;

    await Share.shareXFiles([
      XFile(
        encryptedResult.value!.file.path,
      )
    ]);
  }

  Future<void> downloadFile() async {
    try {
      final result = encryptedResult.value;
      if (result == null) return;

      final params = SaveFileDialogParams(
        sourceFilePath: result.file.path,
        fileName: result.encryptedName,
      );

      final savedPath = await FlutterFileDialog.saveFile(params: params);

      if (savedPath != null) {
        Get.snackbar(
          "Berhasil",
          "File berhasil disimpan",
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );
    }
  }

  ManifestEnkripsi buildManifest() {
    return ManifestEnkripsi(
      signature: EncryptionConstant.signature,
      application: EncryptionConstant.appName,
      formatVersion: EncryptionConstant.formatVersion,
      createdAt: DateTime.now(),
    );
  }

  // Helper
  String formatFileSize(int bytes) {
    const units = [
      "B",
      "KB",
      "MB",
      "GB",
      "TB",
    ];

    double size = bytes.toDouble();

    int unitIndex = 0;

    while (size >= 1024 && unitIndex < units.length - 1) {
      size /= 1024;
      unitIndex++;
    }

    return "${size.toStringAsFixed(2)} ${units[unitIndex]}";
  }

  @override
  void onClose() {
    fileNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    hintController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  void resetFormulir() {
    selectedPlatformFile.value = null;
    selectedFile.value = null;
    encryptedResult.value = null;
    isEncrypting.value = false;
    progress.value = 0.0;
    fileNameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    hintController.clear();
    descriptionController.clear();
  }
}
