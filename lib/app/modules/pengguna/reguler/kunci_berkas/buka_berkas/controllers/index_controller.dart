import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:cryptography/cryptography.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path/path.dart' as path;
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../../data/services/PBE_encryption/checksum_service.dart';
import '../../../../../../data/services/PBE_encryption/encrypted_metadata.dart';
import '../../../../../../data/services/PBE_encryption/encryption_constant.dart';
import '../../../../../../data/services/PBE_encryption/encryption_result.dart';
import '../../../../../../data/services/PBE_encryption/encryption_service.dart';
import '../../../../../../data/services/PBE_encryption/manifest_enkripsi.dart';
import '../../../../../../data/services/PBE_encryption/password_service.dart';
import '../../../../../../data/services/PBE_encryption/storage_service.dart';

class IndexBukaKunciBerkasController extends GetxController {
  final EnkripsiService encryptionService = EnkripsiService();
  final PenyimpananService storageService = PenyimpananService();
  final ChecksumService checksumService = const ChecksumService();
  final PasswordService passwordService = const PasswordService();

  final selectedFile = Rxn<File>();
  final selectedPlatformFile = Rxn<PlatformFile>();

  final manifest = Rxn<ManifestEnkripsi>();
  final metadata = Rxn<MetadataEnkripsi>();

  final decryptedResult = Rxn<EncryptionResult>();

  final isDecrypting = false.obs;

  final progress = 0.0.obs;

  final passwordController = TextEditingController();

  Archive? archive;

  Uint8List? cipherBytes;

  Future<void> pilihBerkas() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        "dclock",
      ],
    );

    if (result == null) return;

    selectedFile.value = File(
      result.files.single.path!,
    );

    await bacaArchive();
  }

  void onFileChanged(PlatformFile? file) async {
    if (file == null) {
      selectedPlatformFile.value = null;
      selectedFile.value = null;
      manifest.value = null;
      metadata.value = null;
      cipherBytes = null;
      archive = null;
      return;
    }

    selectedPlatformFile.value = file;
    selectedFile.value = File(file.path!);

    await bacaArchive();
  }

  Future<void> bacaArchive() async {
    try {
      progress.value = 0.1;

      final bytes = await selectedFile.value!.readAsBytes();

      archive = ZipDecoder().decodeBytes(bytes);

      progress.value = 0.2;

      final manifestFile = archive!.findFile(
        "manifest.json",
      );

      final metadataFile = archive!.findFile(
        "metadata.json",
      );

      final cipherFile = archive!.findFile(
        "cipher.bin",
      );

      if (manifestFile == null || metadataFile == null || cipherFile == null) {
        throw Exception(
          "Format file tidak valid",
        );
      }

      manifest.value = ManifestEnkripsi.decode(
        utf8.decode(
          manifestFile.content,
        ),
      );

      metadata.value = MetadataEnkripsi.decode(
        utf8.decode(
          metadataFile.content,
        ),
      );

      cipherBytes = Uint8List.fromList(
        cipherFile.content,
      );

      validasiManifest();

      validasiMetadata();

      progress.value = 1;
    } on SecretBoxAuthenticationError {
      Get.snackbar(
        "Kata Sandi Salah",
        "Kata Sandi yang dimasukkan tidak sesuai.",
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );
    }
  }

  bool validasiManifest() {
    final data = manifest.value;

    if (data == null) {
      throw Exception("Manifest tidak ditemukan");
    }

    if (data.signature != EncryptionConstant.signature) {
      throw Exception(
        "Signature tidak valid",
      );
    }

    if (data.application != EncryptionConstant.appName) {
      throw Exception(
        "File bukan berasal dari DocLock",
      );
    }

    if (data.formatVersion != EncryptionConstant.formatVersion) {
      throw Exception(
        "Versi file tidak didukung",
      );
    }

    return true;
  }

  bool validasiMetadata() {
    final data = metadata.value;

    if (data == null) {
      throw Exception(
        "Metadata tidak ditemukan",
      );
    }

    if (data.algorithm != EncryptionConstant.algorithm) {
      throw Exception(
        "Algoritma tidak sesuai",
      );
    }

    if (data.salt.isEmpty || data.nonce.isEmpty || data.mac.isEmpty) {
      throw Exception(
        "Metadata rusak",
      );
    }

    return true;
  }

  Future<bool> validasiPassword() async {
    final data = metadata.value!;

    final key = await encryptionService.deriveKeyBytes(
      passwordController.text,
      base64Decode(
        data.salt,
      ),
    );

    final hash = passwordService.hashKey(
      key,
    );

    return hash == data.passwordHash;
  }

  Future<void> prosesDekripsi() async {
    if (selectedFile.value == null) {
      Get.snackbar(
        "Error",
        "Silakan pilih file.",
      );
      return;
    }

    if (passwordController.text.isEmpty) {
      Get.snackbar(
        "Password",
        "Masukkan password.",
      );
      return;
    }

    try {
      isDecrypting.value = true;

      progress.value = 0.1;

      final data = metadata.value!;

      final plainBytes = await encryptionService.decrypt(
        cipher: cipherBytes!,
        password: passwordController.text,
        salt: base64Decode(data.salt),
        nonce: base64Decode(data.nonce),
        mac: base64Decode(data.mac),
      );

      progress.value = 0.6;

      final valid = checksumService.verify(
        bytes: plainBytes,
        expectedChecksum: data.checksum,
      );

      if (!valid) {
        throw Exception(
          "Checksum tidak sesuai. File kemungkinan rusak.",
        );
      }

      progress.value = 0.8;

      final output = await saveDecryptedFile(
        plainBytes,
      );

      progress.value = 0.95;

      decryptedResult.value = EncryptionResult(
        file: output,
        originalName: data.originalFileName,
        encryptedName: path.basename(
          selectedFile.value!.path,
        ),
        size: data.readableSize,
        encryptedAt: DateTime.now(),
      );

      progress.value = 1;

      Get.snackbar(
        "Berhasil",
        "File berhasil didekripsi.",
      );
    } catch (e) {
      Get.snackbar(
        "Dekripsi Gagal",
        e.toString(),
      );
    } finally {
      isDecrypting.value = false;
    }
  }

  Future<void> bukaFile() async {
    if (decryptedResult.value == null) return;

    await OpenFilex.open(
      decryptedResult.value!.file.path,
    );
  }

  Future<void> shareFile() async {
    if (decryptedResult.value == null) return;

    await Share.shareXFiles([
      XFile(
        decryptedResult.value!.file.path,
      ),
    ]);
  }

  Future<void> downloadFile() async {
    if (decryptedResult.value == null) return;

    final params = SaveFileDialogParams(
      sourceFilePath: decryptedResult.value!.file.path,
      fileName: decryptedResult.value!.originalName,
    );

    await FlutterFileDialog.saveFile(
      params: params,
    );
  }

  Future<File> saveDecryptedFile(
    Uint8List bytes,
  ) async {
    final folder = await storageService.decryptedDirectory();

    final file = File(
      "${folder.path}/${metadata.value!.originalFileName}",
    );

    await file.writeAsBytes(bytes);

    return file;
  }

  void resetForm() {
    selectedFile.value = null;
    manifest.value = null;
    metadata.value = null;
    decryptedResult.value = null;
    archive = null;
    cipherBytes = null;
    passwordController.clear();
    progress.value = 0;
  }

  @override
  void onClose() {
    passwordController.dispose();

    super.onClose();
  }
}
