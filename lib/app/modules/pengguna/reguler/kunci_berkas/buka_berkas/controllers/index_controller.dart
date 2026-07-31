import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:cryptography/cryptography.dart';
import 'package:doclock_app/core/errors/app_snackbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path/path.dart' as path;
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../../../core/errors/app_toast.dart';
import '../../../../../../data/local/isar/models/riwayat_aktivitas_model.dart';
import '../../../../../../data/local/isar/repository/berkas_repository.dart';
import '../../../../../../data/local/isar/repository/riwayat_aktivitas_repository.dart';
import '../../../../../../data/local/isar/services/auth/pengguna/auth_service.dart';
import '../../../../../../data/services/PBE_encryption/layanan_checksum.dart';
import '../../../../../../data/services/PBE_encryption/enkripsi_metadata.dart';
import '../../../../../../data/services/PBE_encryption/enkripsi_konstan.dart';
import '../../../../../../data/services/PBE_encryption/hasil_enkripsi.dart';
import '../../../../../../data/services/PBE_encryption/layanan_enkripsi.dart';
import '../../../../../../data/services/PBE_encryption/manifestasi_enkripsi.dart';
import '../../../../../../data/services/PBE_encryption/layanan_sandi.dart';
import '../../../../../../data/services/PBE_encryption/layanan_penyimpanan.dart';

class IndexBukaKunciBerkasController extends GetxController {
  final AuthServicePengguna _layananAutentikasi =
      Get.find<AuthServicePengguna>();

  final RepositoriBerkas repositoriBerkas = RepositoriBerkas();
  final RepositoriRiwayatAktivitas repositoriRiwayat =
      RepositoriRiwayatAktivitas();

  final LayananEnkripsi layananEnkripsi = LayananEnkripsi();
  final LayananPenyimpanan layananPenyimpanan = LayananPenyimpanan();
  final LayananChecksum layananChecksum = const LayananChecksum();
  final LayananSandi layananSandi = const LayananSandi();

  final memilihBerkas = Rxn<File>();
  final memilihPlatformBerkas = Rxn<PlatformFile>();
  final kataSandiController = TextEditingController();
  final manifest = Rxn<ManifestasiEnkripsi>();
  final metadata = Rxn<EnkripsiMetadataModel>();
  final hasilDekripsi = Rxn<HasilEnkripsi>();

  final isDecrypting = false.obs;
  final proses = 0.0.obs;

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

    memilihBerkas.value = File(
      result.files.single.path!,
    );

    await bacaArsip();
  }

  void saatBerkasBerubah(PlatformFile? file) async {
    if (file == null) {
      memilihPlatformBerkas.value = null;
      memilihBerkas.value = null;
      manifest.value = null;
      metadata.value = null;
      cipherBytes = null;
      archive = null;
      return;
    }

    memilihPlatformBerkas.value = file;
    memilihBerkas.value = File(file.path!);

    await bacaArsip();
  }

  Future<void> bacaArsip() async {
    try {
      proses.value = 0.1;

      final bytes = await memilihBerkas.value!.readAsBytes();

      archive = ZipDecoder().decodeBytes(bytes);

      proses.value = 0.2;

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
          "Format berkas tidak valid",
        );
      }

      manifest.value = ManifestasiEnkripsi.decode(
        utf8.decode(
          manifestFile.content,
        ),
      );

      metadata.value = EnkripsiMetadataModel.decode(
        utf8.decode(
          metadataFile.content,
        ),
      );

      cipherBytes = Uint8List.fromList(
        cipherFile.content,
      );

      validasiManifestasi();
      validasiMetadata();

      proses.value = 1;
    } on SecretBoxAuthenticationError {
      AppSnackbar.gagal(
        title: "Kata Sandi Salah",
        message: "Kata Sandi yang dimasukkan tidak sesuai.",
      );
    } catch (e) {
      AppSnackbar.gagal(
        title: "Terjadi Kesalahan",
        message: "terjadi kesalahan, silahkan coba lagi",
      );
    }
  }

  bool validasiManifestasi() {
    final data = manifest.value;

    if (data == null) {
      throw Exception("Manifestasi tidak ditemukan");
    }

    if (data.signature != EnkripsiKonstan.signature) {
      throw Exception(
        "Signature tidak valid",
      );
    }

    if (data.application != EnkripsiKonstan.appName) {
      throw Exception(
        "Berkas bukan berasal dari DocLock",
      );
    }

    if (data.formatVersion != EnkripsiKonstan.formatVersion) {
      throw Exception(
        "Versi Berkas tidak didukung",
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

    if (data.algorithm != EnkripsiKonstan.algorithm) {
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

  Future<bool> validasiSandi() async {
    final data = metadata.value!;

    final key = await layananEnkripsi.ambilKunciByte(
      kataSandiController.text,
      base64Decode(
        data.salt,
      ),
    );

    final hash = layananSandi.kunciHash(
      key,
    );

    return hash == data.passwordHash;
  }

  Future<void> prosesDekripsi() async {
    if (memilihBerkas.value == null) {
      AppSnackbar.gagal(
        title: "Terjadi Kesalahan",
        message: "Silahkan Pilih Berkas Anda!",
      );
      return;
    }

    if (kataSandiController.text.isEmpty) {
      AppSnackbar.gagal(
        title: "Terjadi Kesalahan",
        message: "Masukkan Kata Sandi Anda!",
      );
      return;
    }

    try {
      isDecrypting.value = true;
      proses.value = 0.1;

      final data = metadata.value!;

      final plainBytes = await layananEnkripsi.dekripsi(
        cipher: cipherBytes!,
        password: kataSandiController.text,
        salt: base64Decode(data.salt),
        nonce: base64Decode(data.nonce),
        mac: base64Decode(data.mac),
      );

      proses.value = 0.6;

      final valid = layananChecksum.verifikasi(
        bytes: plainBytes,
        expectedChecksum: data.checksum,
      );

      if (!valid) {
        throw Exception(
          "Checksum tidak sesuai. File kemungkinan rusak.",
        );
      }

      proses.value = 0.8;

      final output = await simpanBerkasDekripsi(
        plainBytes,
      );

      await simpanBasisDataDekripsi(output);

      proses.value = 0.95;

      hasilDekripsi.value = HasilEnkripsi(
        file: output,
        originalName: data.originalFileName,
        encryptedName: path.basename(
          memilihBerkas.value!.path,
        ),
        size: data.readableSize,
        encryptedAt: DateTime.now(),
      );

      proses.value = 1;

      AppToast.sukses(title: "Berkas Berhasil Di Dekripsi");

      final idPengguna = await _layananAutentikasi.sesiSaatIni();

      if (idPengguna != null) {
        await repositoriRiwayat.tambah(
          idAkun: idPengguna.idAkun,
          judulAktivitas: "Buka Kunci Berkas",
          deskripsi: path.basename(memilihBerkas.value!.path),
          alamatIp: "-",
          namaPerangkat: Platform.operatingSystem,
          status: StatusAktivitas.berhasil,
        );
      }
    } on SecretBoxAuthenticationError {
      AppSnackbar.gagal(
        title: "Kata Sandi Salah",
        message: "Kata sandi yang dimasukkan tidak sesuai.",
      );
    } catch (e) {
      AppSnackbar.gagal(
        title: "Terjadi Kesalahan",
        message: "Gagal melakukan dekripsi, silahkan coba lagi nanti!",
      );
    } finally {
      isDecrypting.value = false;
    }
  }

  Future<void> simpanBasisDataDekripsi(
    File output,
  ) async {
    final idPengguna = await _layananAutentikasi.sesiSaatIni();

    if (idPengguna == null) {
      return;
    }

    final data = metadata.value!;

    await repositoriBerkas.simpanHasilDekripsi(
      idPengguna: idPengguna.idAkun,
      kodeUnik: data.id,
      namaBerkasAsli: data.originalFileName,
      namaBerkasEnkripsi: path.basename(
        memilihBerkas.value!.path,
      ),
      ukuranBerkas: output.lengthSync(),
      ekstensiBerkas: path.extension(
        data.originalFileName,
      ),
      judulRiwayat: "Dekripsi Berkas",
      keteranganRiwayat: "Berkas ${data.originalFileName} berhasil didekripsi.",
    );
  }

  Future<void> bukaBerkas() async {
    if (hasilDekripsi.value == null) return;

    await OpenFilex.open(
      hasilDekripsi.value!.file.path,
    );
  }

  Future<void> bagikanBerkas() async {
    if (hasilDekripsi.value == null) return;

    await Share.shareXFiles([
      XFile(
        hasilDekripsi.value!.file.path,
      ),
    ]);
  }

  Future<void> unduhBerkas() async {
    if (hasilDekripsi.value == null) return;

    final params = SaveFileDialogParams(
      sourceFilePath: hasilDekripsi.value!.file.path,
      fileName: hasilDekripsi.value!.originalName,
    );

    await FlutterFileDialog.saveFile(
      params: params,
    );
  }

  Future<File> simpanBerkasDekripsi(
    Uint8List bytes,
  ) async {
    final folder = await layananPenyimpanan.dekripsiDirektori();
    final file = File(
      "${folder.path}/${metadata.value!.originalFileName}",
    );
    await file.writeAsBytes(bytes);
    return file;
  }

  void bersihkanFormulir() {
    memilihBerkas.value = null;
    manifest.value = null;
    metadata.value = null;
    hasilDekripsi.value = null;
    archive = null;
    cipherBytes = null;
    kataSandiController.clear();
    proses.value = 0;
  }

  @override
  void onClose() {
    kataSandiController.dispose();
    super.onClose();
  }
}
