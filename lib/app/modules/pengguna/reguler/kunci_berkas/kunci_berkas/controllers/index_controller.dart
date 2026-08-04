import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:doclock_app/app/data/services/PBE_encryption/enkripsi_metadata.dart';
import 'package:doclock_app/core/errors/app_toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:get/get.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart' as path;
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../../core/errors/app_snackbar.dart';
import '../../../../../../../localization/locale_keys.dart';
import '../../../../../../data/local/isar/models/berkas_model.dart';
import '../../../../../../data/local/isar/models/riwayat_aktivitas_model.dart';
import '../../../../../../data/local/isar/models/riwayat_berkas_model.dart';
import '../../../../../../data/local/isar/repository/berkas_repository.dart';
import '../../../../../../data/local/isar/repository/riwayat_aktivitas_repository.dart';
import '../../../../../../data/local/isar/repository/riwayat_berkas_repository.dart';
import '../../../../../../data/local/isar/repository/sesi_repository.dart';
import '../../../../../../data/local/isar/services/main/storage_checker.dart';
import '../../../../../../data/services/PBE_encryption/layanan_checksum.dart';
import '../../../../../../data/services/PBE_encryption/enkripsi_konstan.dart';
import '../../../../../../data/services/PBE_encryption/hasil_enkripsi.dart';
import '../../../../../../data/services/PBE_encryption/layanan_enkripsi.dart';
import '../../../../../../data/services/PBE_encryption/manifestasi_enkripsi.dart';

import '../../../../../../data/services/PBE_encryption/layanan_sandi.dart';
import '../../../../../../data/services/PBE_encryption/layanan_penyimpanan.dart';
import '../../../../../../data/services/connection/network_guard.dart';

class IndexKunciBerkasController extends GetxController {
  final RepositoriSesi repositoriSesi = RepositoriSesi();
  final RepositoriBerkas repositoriBerkas = RepositoriBerkas();
  final RepositoriRiwayatBerkas repositoriRiwayatBerkas =
      RepositoriRiwayatBerkas();
  final RepositoriRiwayatAktivitas repositoriRiwayat =
      RepositoriRiwayatAktivitas();

  final LayananEnkripsi layananEnkripsi = LayananEnkripsi();
  final LayananPenyimpanan layananPenyimpanan = LayananPenyimpanan();
  final LayananChecksum layananChecksum = const LayananChecksum();
  final LayananSandi layananSandi = const LayananSandi();

  final hasilEnkripsi = Rxn<HasilEnkripsi>();
  final memilihPlatformBerkas = Rxn<PlatformFile>();
  final memilihBerkas = Rxn<File>();

  final isEncrypting = false.obs;
  final proses = 0.0.obs;
  final namaBerkasController = TextEditingController();
  final kataSandiController = TextEditingController();
  final konfirmasiKataSandiController = TextEditingController();
  final petunjukSandiController = TextEditingController();
  final deskripsiController = TextEditingController();

  static const int maxFileSize = 100 * 1024 * 1024;

  Future<void> pilihBerkas() async {
    final result = await FilePicker.platform.pickFiles(
      withData: false,
    );

    if (result == null) return;

    memilihBerkas.value = File(
      result.files.single.path!,
    );

    namaBerkasController.text =
        path.basenameWithoutExtension(result.files.single.name);
  }

  void saatBerkasBerubah(PlatformFile? file) {
    if (file == null) {
      memilihPlatformBerkas.value = null;
      memilihBerkas.value = null;
      namaBerkasController.clear();
      return;
    }

    memilihPlatformBerkas.value = file;
    memilihBerkas.value = File(file.path!);

    namaBerkasController.text = path.basenameWithoutExtension(file.name);
  }

  bool validasiDataInput() {
    if (memilihBerkas.value == null) {
      AppSnackbar.gagal(
        title: LocaleKeys.invalidFileTitle.tr,
        message: LocaleKeys.noEncryptedFileDesc.tr,
      );
      return false;
    }

    if (namaBerkasController.text.trim().isEmpty) {
      AppSnackbar.gagal(
        title: LocaleKeys.emptyFileNameTitle.tr,
        message: LocaleKeys.emptyFileNameDesc.tr,
      );
      return false;
    }

    if (namaBerkasController.text.trim().length > 50) {
      AppSnackbar.gagal(
        title: LocaleKeys.fileNameTooLongTitle.tr,
        message: LocaleKeys.fileNameTooLongDesc.tr,
      );
      return false;
    }

    if (kataSandiController.text.isEmpty) {
      AppSnackbar.gagal(
        title: LocaleKeys.emptyPasswordTitle.tr,
        message: LocaleKeys.emptyPasswordDesc.tr,
      );
      return false;
    }

    if (kataSandiController.text.length < 8) {
      AppSnackbar.gagal(
        title: LocaleKeys.passwordTooShortTitle.tr,
        message: LocaleKeys.passwordTooShortDesc.tr,
      );
      return false;
    }

    if (kataSandiController.text.length > 15) {
      AppSnackbar.gagal(
        title: LocaleKeys.passwordTooLongTitle.tr,
        message: LocaleKeys.passwordTooLongDesc.tr,
      );

      return false;
    }

    if (konfirmasiKataSandiController.text.isEmpty) {
      AppSnackbar.gagal(
        title: LocaleKeys.emptyConfirmPasswordTitle.tr,
        message: LocaleKeys.emptyConfirmPasswordDesc.tr,
      );
      return false;
    }

    if (kataSandiController.text != konfirmasiKataSandiController.text) {
      AppSnackbar.gagal(
        title: LocaleKeys.passwordMismatchTitle.tr,
        message: LocaleKeys.passwordMismatchDesc.tr,
      );
      return false;
    }

    if (petunjukSandiController.text.length > 25) {
      AppSnackbar.gagal(
        title: LocaleKeys.passwordHintTooLongTitle.tr,
        message: LocaleKeys.passwordHintTooLongDesc.tr,
      );
      return false;
    }

    if (deskripsiController.text.length > 150) {
      AppSnackbar.gagal(
        title: LocaleKeys.descriptionTooLongTitle.tr,
        message: LocaleKeys.descriptionTooLongDesc.tr,
      );
      return false;
    }

    return true;
  }

  bool validasiMetadata(EnkripsiMetadataModel metadata) {
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

  bool validasiUkuranBerkas() {
    final file = memilihPlatformBerkas.value;

    if (file == null) {
      return false;
    }

    if (file.size > maxFileSize) {
      AppSnackbar.gagal(
        title: LocaleKeys.fileSizeTooLargeTitle.tr,
        message: LocaleKeys.fileSizeTooLargeDesc.tr,
      );

      return false;
    }

    return true;
  }

  Future<bool> validasiPenyimpanan() async {
    final file = memilihPlatformBerkas.value;

    if (file == null) {
      return false;
    }

    final cukup = await StorageChecker.hasEnoughStorage(
      requiredBytes: file.size,
    );

    if (!cukup) {
      await StorageChecker.showStorageFullDialog();
      return false;
    }

    return true;
  }

  Future<EnkripsiMetadataModel> buatMetadataBerkas({
    required Uint8List originalBytes,
    required Map<String, dynamic> encrypted,
    required List<int> keyBytes,
  }) async {
    return EnkripsiMetadataModel(
      id: const Uuid().v4(),
      salt: base64Encode(encrypted["salt"]),
      nonce: base64Encode(encrypted["nonce"]),
      mac: base64Encode(encrypted["mac"]),
      originalName: path.basenameWithoutExtension(memilihBerkas.value!.path),
      originalExtension: path.extension(memilihBerkas.value!.path),
      originalSize: originalBytes.length,
      hint: petunjukSandiController.text,
      description: deskripsiController.text,
      createdAt: DateTime.now(),
      algorithm: EnkripsiKonstan.algorithm,
      iteration: EnkripsiKonstan.pbkdf2Iteration,
      checksum: layananChecksum.membuat(originalBytes),
      formatVersion: EnkripsiKonstan.formatVersion,
      integrityProtected: true,
      encryptedSize: encrypted["cipher"].length,
      originalFileName: path.basename(memilihBerkas.value!.path),
      mimeType: lookupMimeType(
            memilihBerkas.value!.path,
          ) ??
          "application/octet-stream",
      lastModified: await memilihBerkas.value!.lastModified(),
      readableSize: formatUkuranBerkas(
        originalBytes.length,
      ),
      passwordHash: layananSandi.kunciHash(
        keyBytes,
      ),
    );
  }

  Future<Uint8List> buatArsip({
    required ManifestasiEnkripsi manifest,
    required EnkripsiMetadataModel metadata,
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

  Future<File> simpanEnkripsiBerkas(Uint8List bytes) async {
    final folder = await layananPenyimpanan.enkripsiDirektori();

    final output = File(
      "${folder.path}/${namaBerkasController.text}.dclock",
    );

    await output.writeAsBytes(bytes);

    return output;
  }

  Future<void> prosesKunciBerkas() async {
    if (!await NetworkGuard.check()) {
      return;
    }
    if (!validasiDataInput()) return;
    if (!validasiUkuranBerkas()) return;
    try {
      isEncrypting.value = true;

      proses.value = 0.1;

      final originalBytes = await memilihBerkas.value!.readAsBytes();

      proses.value = 0.2;

      final encrypted = await layananEnkripsi.enkripsi(
        bytes: originalBytes,
        password: kataSandiController.text,
      );

      proses.value = 0.4;

      final keyBytes = await layananEnkripsi.ambilKunciByte(
        kataSandiController.text,
        encrypted["salt"],
      );

      proses.value = 0.5;

      final metadata = await buatMetadataBerkas(
        originalBytes: originalBytes,
        encrypted: encrypted,
        keyBytes: keyBytes,
      );

      proses.value = 0.7;

      final manifest = buatManifestasi();

      final archive = await buatArsip(
        manifest: manifest,
        metadata: metadata,
        encrypted: encrypted,
      );

      proses.value = 0.9;

      final file = await simpanEnkripsiBerkas(
        archive,
      );

      await simpanBasisDataEnkripsi(
        fileEnkripsi: file,
      );

      hasilEnkripsi.value = HasilEnkripsi(
        file: file,
        originalName: memilihBerkas.value!.path.split("/").last,
        encryptedName: path.basename(file.path),
        size: formatUkuranBerkas(file.lengthSync()),
        encryptedAt: DateTime.now(),
      );

      proses.value = 1;

      AppToast.sukses(
        title: LocaleKeys.encryptionCompleted.tr,
      );

      final sesi = await repositoriSesi.dapatkanSesiAktif();

      if (sesi != null) {
        await repositoriRiwayat.tambah(
          idAkun: sesi.idAkun,
          judulAktivitas: LocaleKeys.encryptedFile,
          deskripsi: path.basename(memilihBerkas.value!.path),
          alamatIp: "-",
          namaPerangkat: Platform.operatingSystem,
          status: StatusAktivitas.berhasil,
        );
      }
    } catch (e) {
      AppSnackbar.gagal(
        title: LocaleKeys.anError,
        message: LocaleKeys.anErrorDesc,
      );
      final sesi = await repositoriSesi.dapatkanSesiAktif();

      if (sesi != null) {
        await repositoriRiwayat.tambah(
          idAkun: sesi.idAkun,
          judulAktivitas: LocaleKeys.encryptedFile,
          deskripsi: path.basename(memilihBerkas.value!.path),
          alamatIp: "-",
          namaPerangkat: Platform.operatingSystem,
          status: StatusAktivitas.gagal,
        );
      }
    } finally {
      isEncrypting.value = false;
    }
  }

  Future<void> simpanBasisDataEnkripsi({
    required File fileEnkripsi,
  }) async {
    final sesi = await repositoriSesi.dapatkanSesiAktif();

    if (sesi == null) return;

    final cukup = await StorageChecker.hasEnoughStorage(
      requiredBytes: 0,
    );

    if (!cukup) {
      await StorageChecker.showStorageFullDialog();
      return;
    }

    final kodeUnik = const Uuid().v4();

    final idBerkas = await repositoriBerkas.tambahBerkas(
      idPengguna: sesi.idAkun,
      kodeUnik: kodeUnik,
      namaBerkasAsli: path.basename(memilihBerkas.value!.path),
      namaBerkasEnkripsi: path.basename(fileEnkripsi.path),
      ukuranBerkas: fileEnkripsi.lengthSync(),
      ekstensiBerkas: path.extension(memilihBerkas.value!.path),
      status: StatusBerkas.terkunci,
      waktuTerkunci: DateTime.now(),
    );

    await repositoriRiwayatBerkas.tambah(
      idBerkas: idBerkas,
      idPengguna: sesi.idAkun,
      judul: LocaleKeys.encryptActivity.tr,
      keterangan: LocaleKeys.encryptActivityDesc.tr.replaceFirst(
        "%s",
        path.basename(memilihBerkas.value!.path),
      ),
      status: StatusRiwayatBerkas.terkunci,
    );
  }

  Future<void> bukaBerkas() async {
    if (hasilEnkripsi.value == null) return;

    await OpenFilex.open(
      hasilEnkripsi.value!.file.path,
    );
  }

  Future<void> bagikanBerkas() async {
    if (hasilEnkripsi.value == null) return;

    await Share.shareXFiles([
      XFile(
        hasilEnkripsi.value!.file.path,
      )
    ]);
  }

  Future<void> unduhBerkas() async {
    try {
      final result = hasilEnkripsi.value;
      if (result == null) return;

      final params = SaveFileDialogParams(
        sourceFilePath: result.file.path,
        fileName: result.encryptedName,
      );

      final savedPath = await FlutterFileDialog.saveFile(params: params);

      if (savedPath != null) {
        AppToast.sukses(title: LocaleKeys.successful);
      }
    } catch (e) {
      AppSnackbar.gagal(
        title: LocaleKeys.anError,
        message: LocaleKeys.anErrorDesc,
      );
    }
  }

  ManifestasiEnkripsi buatManifestasi() {
    return ManifestasiEnkripsi(
      signature: EnkripsiKonstan.signature,
      application: EnkripsiKonstan.appName,
      formatVersion: EnkripsiKonstan.formatVersion,
      createdAt: DateTime.now(),
    );
  }

  // Helper
  String formatUkuranBerkas(int bytes) {
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
    namaBerkasController.dispose();
    kataSandiController.dispose();
    konfirmasiKataSandiController.dispose();
    petunjukSandiController.dispose();
    deskripsiController.dispose();
    super.onClose();
  }

  void bersihkanFormulir() {
    memilihPlatformBerkas.value = null;
    memilihBerkas.value = null;
    hasilEnkripsi.value = null;
    isEncrypting.value = false;
    proses.value = 0.0;
    namaBerkasController.clear();
    kataSandiController.clear();
    konfirmasiKataSandiController.clear();
    petunjukSandiController.clear();
    deskripsiController.clear();
  }
}
