import 'package:doclock_app/core/errors/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../../../../../core/errors/app_confirmationAlert.dart';
import '../../../../../../core/utils/security/app_password_hasher.dart';
import '../../../../../../localization/locale_keys.dart';
import '../../../../../data/local/isar/repository/akun_repository.dart';
import '../../../../../data/local/isar/repository/pengguna_repository.dart';

class IndexDaftarPenggunaController extends GetxController {
  IndexDaftarPenggunaController({
    RepositoriPengguna? repositoriPengguna,
    RepositoriAkun? repositoriAkun,
    Isar? isar,
  }) : _repositoriPengguna = repositoriPengguna ?? RepositoriPengguna(),
       _repositoriAkun = repositoriAkun ?? RepositoriAkun();

  final RepositoriPengguna _repositoriPengguna;
  final RepositoriAkun _repositoriAkun;

  final formKey = GlobalKey<FormState>();

  final isLoading = false.obs;

  final namaLengkapController = TextEditingController();
  final namaPenggunaController = TextEditingController();
  final emailController = TextEditingController();
  final kataSandiController = TextEditingController();
  final konfirmasiKataSandiController = TextEditingController();

  @override
  void onClose() {
    namaLengkapController.dispose();
    namaPenggunaController.dispose();
    emailController.dispose();
    kataSandiController.dispose();
    konfirmasiKataSandiController.dispose();

    super.onClose();
  }

  String? validasiNamaLengkap(String? value) {
    final nama = value?.trim() ?? '';

    if (nama.isEmpty) {
      return LocaleKeys.fullNameRequired.tr;
    }

    if (nama.length < 3) {
      return LocaleKeys.fullNameMinLength.tr;
    }

    if (nama.length > 40) {
      return LocaleKeys.fullNameMaxLength.tr;
    }
    final regex = RegExp(r"^[a-zA-ZÀ-ÿ\s.'-]+$");

    if (!regex.hasMatch(nama)) {
      return LocaleKeys.fullNameInvalidCharacter.tr;
    }

    if (RegExp(r'\s{2,}').hasMatch(nama)) {
      return LocaleKeys.fullNameMultipleSpaces.tr;
    }

    return null;
  }

  String? validasiNamaPengguna(String? value) {
    final username = value?.trim() ?? '';

    if (username.isEmpty) {
      return LocaleKeys.usernameRequired.tr;
    }

    if (username.length < 4) {
      return LocaleKeys.usernameMinLength.tr;
    }

    if (username.length > 15) {
      return LocaleKeys.usernameMaxLength.tr;
    }

    if (username.contains(" ")) {
      return LocaleKeys.usernameNoSpaces.tr;
    }

    final regex = RegExp(r'^[a-zA-Z0-9_]+$');

    if (!regex.hasMatch(username)) {
      return LocaleKeys.usernameInvalidCharacter.tr;
    }

    final blockedUsername = [
      "admin",
      "administrator",
      "root",
      "system",
      "null",
      "undefined",
    ];

    if (blockedUsername.contains(username.toLowerCase())) {
      return LocaleKeys.usernameNotAllowed.tr;
    }

    return null;
  }

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

    if (email.contains("..")) {
      return LocaleKeys.invalidEmailDoubleDot.tr;
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

    if (password.length > 24) {
      return LocaleKeys.passwordMaxLength.tr;
    }

    if (password.contains(" ")) {
      return LocaleKeys.passwordNoSpaces.tr;
    }

    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return LocaleKeys.passwordRequireUppercase.tr;
    }

    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return LocaleKeys.passwordRequireNumber.tr;
    }

    return null;
  }

  String? validasiKonfirmasiKataSandi(String? value) {
    final confirm = value ?? '';

    if (confirm.isEmpty) {
      return LocaleKeys.confirmPasswordRequired.tr;
    }

    if (confirm != kataSandiController.text) {
      return LocaleKeys.confirmPasswordMismatch.tr;
    }

    return null;
  }

  Future<void> daftarPengguna() async {
    if (isLoading.value) {
      return;
    }
    if (!formKey.currentState!.validate()) {
      return;
    }
    isLoading.value = true;

    try {
      final email = emailController.text.trim();
      final namaLengkap = namaLengkapController.text.trim();
      final namaPengguna = namaPenggunaController.text.trim();

      final emailSudahAda = await _repositoriAkun.emailSudahDigunakan(email);

      if (emailSudahAda) {
        AppSnackbar.gagal(
          title: LocaleKeys.emailAlreadyExistsTitle.tr,
          message: LocaleKeys.emailAlreadyExistsDesc.tr,
        );
        return;
      }

      final penggunaSudahAda = await _repositoriPengguna
          .namaPenggunaSudahDigunakan(namaPengguna);

      if (penggunaSudahAda) {
        AppSnackbar.gagal(
          title: LocaleKeys.usernameAlreadyExistsTitle.tr,
          message: LocaleKeys.usernameAlreadyExistsDesc.tr,
        );
        return;
      }

      final pengguna = await _repositoriPengguna.tambahPengguna(
        namaLengkap: namaLengkap,
        namaPengguna: namaPengguna,
      );

      final hashedPassword = PasswordHasher.hash(
        kataSandiController.text.trim(),
      );

      await _repositoriAkun.tambahAkun(
        idPengguna: pengguna,
        email: email,
        kataSandi: hashedPassword,
      );

      final berhasil = await ShowConfirmationDialog.show(
        context: Get.context!,
        title: LocaleKeys.registerSuccessTitle.tr,
        subtitle: LocaleKeys.registerSuccessMessage.tr,
        confirmText: LocaleKeys.continueText.tr,
        cancelText: '',
        type: ConfirmationDialogType.success,
      );

      if (berhasil) {
        _bersihkanFormulir();

        Get.back();
      }
    } catch (e) {
      AppSnackbar.gagal(
        title: LocaleKeys.anError,
        message: LocaleKeys.anErrorDesc,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void _bersihkanFormulir() {
    namaLengkapController.clear();
    namaPenggunaController.clear();
    emailController.clear();
    kataSandiController.clear();
    konfirmasiKataSandiController.clear();
    formKey.currentState?.reset();
  }
}
