import 'dart:io';

import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart' as path;
import 'package:share_plus/share_plus.dart';

import '../../../../../../../core/errors/app_confirmationAlert.dart';
import '../../../../../../../core/errors/app_snackbar.dart';
import '../../../../../../../core/errors/app_toast.dart';
import '../../../../../../data/local/isar/models/berkas_model.dart';
import '../../../../../../data/local/isar/models/riwayat_berkas_model.dart';
import '../../../../../../data/local/isar/repository/berkas_repository.dart';
import '../../../../../../data/local/isar/repository/riwayat_berkas_repository.dart';
import '../../../../../../data/services/PBE_encryption/layanan_penyimpanan.dart';

class DetailBerkasController extends GetxController {
  final RepositoriBerkas repositoriBerkas = RepositoriBerkas();
  final RepositoriRiwayatBerkas repositoriRiwayat = RepositoriRiwayatBerkas();

  final LayananPenyimpanan layananPenyimpanan = LayananPenyimpanan();
  final isLoading = true.obs;
  final berkas = Rxn<BerkasModel>();
  final daftarRiwayat = <RiwayatBerkasModel>[].obs;
  late final int idBerkas;
  File? berkasAktif;

  @override
  Future<void> onInit() async {
    super.onInit();

    idBerkas = Get.arguments as int;

    await memuatData();
  }

  Future<void> memuatData() async {
    try {
      isLoading.value = true;

      final data = await repositoriBerkas.berdasarkanId(
        idBerkas,
      );

      if (data == null) {
        AppSnackbar.gagal(
          title: "Data Tidak Ditemukan",
          message: "Berkas tidak tersedia.",
        );

        Get.back();

        return;
      }

      berkas.value = data;

      daftarRiwayat.assignAll(
        await repositoriRiwayat.berdasarkanBerkas(
          idBerkas,
        ),
      );

      await _cekLokasiBerkas();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _cekLokasiBerkas() async {
    if (berkas.value == null) return;

    final folder = berkas.value!.statusBerkas == StatusBerkas.terkunci
        ? await layananPenyimpanan.enkripsiDirektori()
        : await layananPenyimpanan.dekripsiDirektori();

    final namaFile = berkas.value!.statusBerkas == StatusBerkas.terkunci
        ? berkas.value!.namaBerkasEnkripsi
        : berkas.value!.namaBerkasAsli;

    final file = File("${folder.path}/$namaFile");

    berkasAktif = await file.exists() ? file : null;
  }

  bool get tersedia => berkasAktif != null;

  Future<void> bukaBerkas() async {
    if (berkasAktif == null) {
      AppSnackbar.gagal(
        title: "Berkas Tidak Ditemukan",
        message: "File tidak ditemukan.",
      );
      return;
    }

    await OpenFilex.open(berkasAktif!.path);
  }

  Future<void> bagikanBerkas() async {
    if (berkasAktif == null) {
      AppSnackbar.gagal(
        title: "Berkas Tidak Ditemukan",
        message: "File tidak ditemukan.",
      );
      return;
    }

    await Share.shareXFiles([
      XFile(berkasAktif!.path),
    ]);
  }

  Future<void> unduhBerkas() async {
    if (berkasAktif == null) {
      AppSnackbar.gagal(
        title: "Berkas Tidak Ditemukan",
        message: "File tidak ditemukan.",
      );
      return;
    }

    try {
      final params = SaveFileDialogParams(
        sourceFilePath: berkasAktif!.path,
        fileName: path.basename(berkasAktif!.path),
      );

      final hasil = await FlutterFileDialog.saveFile(
        params: params,
      );

      if (hasil != null) {
        AppToast.sukses(
          title: "Berkas berhasil disimpan.",
        );
      }
    } catch (_) {
      AppSnackbar.gagal(
        title: "Gagal",
        message: "Tidak dapat menyimpan berkas.",
      );
    }
  }

  final isDeleting = false.obs;

  Future<void> _hapusBerkasFisik() async {
    if (berkas.value == null) return;

    final folderEnkripsi = await layananPenyimpanan.enkripsiDirektori();

    final folderDekripsi = await layananPenyimpanan.dekripsiDirektori();

    final daftarFile = [
      File(
        "${folderEnkripsi.path}/${berkas.value!.namaBerkasEnkripsi}",
      ),
      File(
        "${folderDekripsi.path}/${berkas.value!.namaBerkasAsli}",
      ),
    ];

    for (final file in daftarFile) {
      try {
        if (await file.exists()) {
          await file.delete();
        }
      } catch (_) {
        AppSnackbar.gagal(
          title: "Gagal",
          message: "Tidak dapat menghapus berkas fisik.",
        );
      }
    }
  }

  Future<void> hapusBerkas() async {
    if (berkas.value == null) return;

    final konfirmasi = await ShowConfirmationDialog.show(
      context: Get.context!,
      title: "Hapus Berkas",
      subtitle: "Apakah Anda yakin ingin menghapus berkas ini?",
      confirmText: "Hapus",
      cancelText: "Batal",
      type: ConfirmationDialogType.danger,
    );

    if (!konfirmasi) return;

    try {
      isDeleting.value = true;

      if (berkasAktif != null && await berkasAktif!.exists()) {
        await berkasAktif!.delete();
      }

      await repositoriBerkas.hapusLengkap(
        berkas.value!.id,
      );

      Get.back(result: true);
    } catch (_) {
      AppSnackbar.gagal(
        title: "Gagal",
        message: "Tidak dapat menghapus berkas.",
      );
    } finally {
      isDeleting.value = false;
    }
  }

  String get ukuran {
    if (berkas.value == null) return "-";

    return formatUkuran(
      berkas.value!.ukuranBerkas,
    );
  }

  String formatUkuran(int bytes) {
    const units = [
      "B",
      "KB",
      "MB",
      "GB",
      "TB",
    ];

    double size = bytes.toDouble();

    int index = 0;

    while (size >= 1024 && index < units.length - 1) {
      size /= 1024;
      index++;
    }

    return "${size.toStringAsFixed(2)} ${units[index]}";
  }

  String get lokasi {
    if (berkasAktif == null) {
      return "-";
    }

    return path.dirname(
      berkasAktif!.path,
    );
  }

  String get namaFile {
    return berkas.value?.namaBerkasAsli ?? "-";
  }

  String get namaEnkripsi {
    return berkas.value?.namaBerkasEnkripsi ?? "-";
  }

  String get ekstensi {
    return berkas.value?.ekstensiBerkas ?? "-";
  }

  String get status {
    if (berkas.value == null) {
      return "-";
    }

    return berkas.value!.statusBerkas == StatusBerkas.terkunci
        ? "Terkunci"
        : "Terbuka";
  }

  DateTime? get waktuTerkunci => berkas.value?.waktuTerkunci;

  DateTime? get waktuTerbuka => berkas.value?.waktuTerbuka;
}
