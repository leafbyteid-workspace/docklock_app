import 'package:doclock_app/core/errors/app_snackbar.dart';
import 'package:doclock_app/core/errors/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../../../../../core/utils/security/app_password_hasher.dart';
import '../../../../../../localization/locale_keys.dart';
import '../../../../../data/local/isar/repository/akun_repository.dart';
import '../../../../../data/local/isar/repository/pengguna_repository.dart';
import '../../../../../data/local/isar/services/main/isar_service.dart';

class IndexDaftarPenggunaController extends GetxController {
  IndexDaftarPenggunaController({
    RepositoriPengguna? repositoriPengguna,
    RepositoriAkun? repositoriAkun,
    Isar? isar,
  })  : _repositoriPengguna = repositoriPengguna ?? RepositoriPengguna(),
        _repositoriAkun = repositoriAkun ?? RepositoriAkun(),
        _isar = isar ?? IsarService.instance.isar;

  final RepositoriPengguna _repositoriPengguna;
  final RepositoriAkun _repositoriAkun;
  final Isar _isar;

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
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.fullNameRequired.tr;
    }

    if (value.trim().length < 3) {
      return LocaleKeys.fullNameMinLength.tr;
    }

    return null;
  }

  String? validasiNamaPengguna(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.usernameRequired.tr;
    }

    if (value.contains(" ")) {
      return LocaleKeys.usernameNoSpaces.tr;
    }

    if (value.length < 4) {
      return LocaleKeys.usernameMinLength.tr;
    }

    return null;
  }

  String? validasiEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.emailRequired.tr;
    }

    if (!GetUtils.isEmail(value.trim())) {
      return LocaleKeys.invalidEmailFormat.tr;
    }

    return null;
  }

  String? validasiKataSandi(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.passwordRequired.tr;
    }

    if (value.length < 8) {
      return LocaleKeys.passwordMinLength.tr;
    }

    return null;
  }

  String? validasiKonfirmasiKataSandi(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.confirmPasswordRequired.tr;
    }

    if (value != kataSandiController.text) {
      return LocaleKeys.confirmPasswordMismatch.tr;
    }

    return null;
  }

  Future<void> daftarPengguna() async {
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

      final penggunaSudahAda =
          await _repositoriPengguna.namaPenggunaSudahDigunakan(
        namaPengguna,
      );

      if (penggunaSudahAda) {
        AppSnackbar.gagal(
          title: LocaleKeys.usernameAlreadyExistsTitle.tr,
          message: LocaleKeys.usernameAlreadyExistsDesc.tr,
        );
        return;
      }

      await _isar.writeTxn(() async {
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
      });

      _bersihkanFormulir();

      AppToast.sukses(
        title: LocaleKeys.registerSuccess.tr,
      );
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
