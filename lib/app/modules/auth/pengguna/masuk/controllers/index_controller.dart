import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/errors/app_snackbar.dart';
import '../../../../../../core/theme/theme_controller.dart';
import '../../../../../../core/utils/security/app_password_hasher.dart';
import '../../../../../data/local/isar/repository/akun_repository.dart';
import '../../../../../data/local/isar/repository/pengguna_repository.dart';
import '../../../../../data/local/isar/services/auth/pengguna/auth_service.dart';
import '../../../../../routes/app_pages.dart';

class IndexMasukPenggunaController extends GetxController {
  IndexMasukPenggunaController({
    RepositoriAkun? repositoriAkun,
    RepositoriPengguna? repositoriPengguna,
  })  : _repositoriAkun = repositoriAkun ?? RepositoriAkun(),
        _repositoriPengguna = repositoriPengguna ?? RepositoriPengguna();

  final ThemeController _themeController = Get.find<ThemeController>();

  final RepositoriAkun _repositoriAkun;
  final RepositoriPengguna _repositoriPengguna;
  final AuthServicePengguna _layananAutentikasi =
      Get.find<AuthServicePengguna>();

  final formKey = GlobalKey<FormState>();

  final isLoading = false.obs;
  final obscurePassword = true.obs;

  final emailController = TextEditingController();
  final kataSandiController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    kataSandiController.dispose();
    super.onClose();
  }

  String? validasiEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email wajib diisi.";
    }

    if (!GetUtils.isEmail(value.trim())) {
      return "Format email tidak valid.";
    }

    return null;
  }

  String? validasiKataSandi(String? value) {
    if (value == null || value.isEmpty) {
      return "Kata sandi wajib diisi.";
    }

    if (value.length < 8) {
      return "Minimal 8 karakter.";
    }

    return null;
  }

  Future<void> masukPengguna() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    try {
      final email = emailController.text.trim();
      final password = kataSandiController.text;
      final akun = await _repositoriAkun.berdasarkanEmail(email);

      if (akun == null) {
        AppSnackbar.gagal(
          title: "Masuk Gagal",
          message: "Email tidak terdaftar.",
        );
        return;
      }

      final valid = PasswordHasher.verify(
        password: password,
        hashedPassword: akun.kataSandi,
      );

      if (!valid) {
        AppSnackbar.gagal(
          title: "Masuk Gagal",
          message: "Password salah.",
        );
        return;
      }
      final pengguna =
          await _repositoriPengguna.berdasarkanId(akun.idPengguna!);

      if (pengguna == null) {
        AppSnackbar.gagal(
          title: "Masuk Gagal",
          message: "Data pengguna tidak ditemukan.",
        );
        return;
      }
      await _layananAutentikasi.masuk(
        idAkun: akun.id,
      );
      emailController.clear();
      kataSandiController.clear();

      await _themeController.load(akun.id);


      Get.offAllNamed(Routes.mainNavigasiPengguna);
    } catch (e) {
      AppSnackbar.gagal(
        title: "Terjadi Kesalahan",
        message: e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
