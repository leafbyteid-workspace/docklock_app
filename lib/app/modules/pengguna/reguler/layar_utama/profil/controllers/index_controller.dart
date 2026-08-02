import 'package:doclock_app/core/errors/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/errors/app_confirmationAlert.dart';
import '../../../../../../data/local/isar/models/pengguna_model.dart';
import '../../../../../../data/local/isar/repository/akun_repository.dart';
import '../../../../../../data/local/isar/repository/pengguna_repository.dart';
import '../../../../../../data/local/isar/services/auth/pengguna/auth_service.dart';
import '../../../../../../routes/app_pages.dart';

class IndexProfilPenggunaController extends GetxController {
  IndexProfilPenggunaController({
    RepositoriPengguna? repositoriPengguna,
    RepositoriAkun? repositoriAkun,
  })  : _repositoriPengguna = repositoriPengguna ?? RepositoriPengguna(),
        _repositoriAkun = repositoriAkun ?? RepositoriAkun();

  final AuthServicePengguna _layananAutentikasi =
      Get.find<AuthServicePengguna>();

  final RepositoriPengguna _repositoriPengguna;
  final RepositoriAkun _repositoriAkun;

  final isLoading = true.obs;
  final isLogoutLoading = false.obs;

  final pengguna = Rxn<PenggunaModel>();
  final email = ''.obs;

  @override
  void onInit() {
    super.onInit();
    muatProfil();
  }

  Future<void> refreshData() async {
    try {
      isLoading.value = true;
      await muatProfil();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> muatProfil() async {
    try {
      isLoading.value = true;

      final idPengguna = await _layananAutentikasi.penggunaSaatIni();

      final dataPengguna = await _repositoriPengguna.berdasarkanId(idPengguna);

      if (dataPengguna == null) {
        throw Exception("Data pengguna tidak ditemukan.");
      }

      final akun = await _repositoriAkun.berdasarkanIdPengguna(idPengguna);

      pengguna.value = dataPengguna;
      email.value = akun?.email ?? "-";
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> keluar(BuildContext context) async {
    final konfirmasi = await ShowConfirmationDialog.show(
      context: context,
      title: "Keluar dari akun?",
      subtitle:
          "Anda akan keluar dari sesi saat ini dan perlu masuk kembali untuk menggunakan aplikasi.",
      confirmText: "Keluar",
      cancelText: "Batal",
      type: ConfirmationDialogType.warning,
    );

    if (!konfirmasi) return;

    try {
      isLogoutLoading.value = true;

      await _layananAutentikasi.keluar();

      Get.deleteAll(force: true);
      Get.offAllNamed(Routes.indexMasukPengguna);

      AppSnackbar.sukses(
        title: "Akun Berhasil Dikeluarkan",
        message: "Silahkan Melakukan Sesi Masuk Akun Lagi!",
      );
    } catch (e) {
      AppSnackbar.sukses(
        title: "Terjadi Kesalahan",
        message: "Gagal ketika keluar akun, Silahkan Coba Lagi!",
      );
    } finally {
      isLogoutLoading.value = false;
    }
  }
}
