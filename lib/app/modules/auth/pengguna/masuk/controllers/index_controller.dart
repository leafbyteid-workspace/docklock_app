import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/errors/app_snackbar.dart';
import '../../../../../../core/theme/app_theme_service.dart';
import '../../../../../../core/utils/security/app_password_hasher.dart';
import '../../../../../../localization/locale_keys.dart';
import '../../../../../../localization/localization_service.dart';
import '../../../../../data/local/isar/repository/akun_repository.dart';
import '../../../../../data/local/isar/repository/pengguna_repository.dart';
import '../../../../../data/local/isar/services/auth/pengguna/auth_service.dart';
import '../../../../../routes/app_pages.dart';

class IndexMasukPenggunaController extends GetxController {
  IndexMasukPenggunaController({
    RepositoriAkun? repositoriAkun,
    RepositoriPengguna? repositoriPengguna,
  }) : _repositoriAkun = repositoriAkun ?? RepositoriAkun(),
       _repositoriPengguna = repositoriPengguna ?? RepositoriPengguna();

  final RepositoriAkun _repositoriAkun;
  final RepositoriPengguna _repositoriPengguna;
  final AuthServicePengguna _layananAutentikasi =
      Get.find<AuthServicePengguna>();

  final formKey = GlobalKey<FormState>();

  final isLoading = false.obs;
  final obscurePassword = true.obs;

  final emailController = TextEditingController();
  final kataSandiController = TextEditingController();

  String? validasiEmail(String? value) {
    final email = value?.trim().toLowerCase() ?? '';

    if (email.isEmpty) {
      return LocaleKeys.emailRequired.tr;
    }

    if (email.length > 254) {
      return LocaleKeys.emailTooLong.tr;
    }

    if (!GetUtils.isEmail(email)) {
      return LocaleKeys.invalidEmailFormat.tr;
    }

    return null;
  }

  String? validasiKataSandi(String? value) {
    final password = value ?? '';

    if (password.isEmpty) {
      return LocaleKeys.passwordRequired.tr;
    }

    if (password.length < 8) {
      return LocaleKeys.passwordMinLength.tr;
    }

    if (password.length > 128) {
      return LocaleKeys.passwordTooLong.tr;
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
          title: LocaleKeys.loginFailedTitle.tr,
          message: LocaleKeys.emailNotRegistered.tr,
        );
        return;
      }
      final valid = PasswordHasher.verify(
        password: password,
        hashedPassword: akun.kataSandi,
      );

      if (!valid) {
        AppSnackbar.gagal(
          title: LocaleKeys.loginFailedTitle.tr,
          message: LocaleKeys.incorrectPassword.tr,
        );
        return;
      }

      final pengguna = await _repositoriPengguna.berdasarkanId(
        akun.idPengguna!,
      );

      if (pengguna == null) {
        AppSnackbar.gagal(
          title: LocaleKeys.loginFailedTitle.tr,
          message: LocaleKeys.userNotFound.tr,
        );
        return;
      }
      await _layananAutentikasi.masuk(idAkun: akun.id);

      emailController.clear();
      kataSandiController.clear();

      final localization = Get.find<LocalizationService>();
      await localization.saveCurrentLocaleToAccount();
      await localization.reloadLocale();

      final themeService = Get.find<AppThemeService>();
      await themeService.muatTema();

      Get.offAllNamed(Routes.mainNavigasiPengguna);
    } catch (e) {
      AppSnackbar.gagal(
        title: LocaleKeys.anError.tr,
        message: LocaleKeys.anErrorDesc.tr,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    kataSandiController.dispose();
    super.onClose();
  }
}
