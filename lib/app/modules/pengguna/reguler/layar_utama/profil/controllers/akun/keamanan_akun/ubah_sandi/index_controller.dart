import 'package:bcrypt/bcrypt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../core/errors/app_snackbar.dart';
import '../../../../../../../../../../localization/locale_keys.dart';
import '../../../../../../../../../data/local/isar/repository/akun_repository.dart';
import '../../../../../../../../../data/local/isar/services/auth/pengguna/auth_service.dart';

class IndexKeamananAkunUbahSandiController extends GetxController {
  final RepositoriAkun _repositoriAkun = RepositoriAkun();
  final AuthServicePengguna _auth = Get.find<AuthServicePengguna>();

  final formKey = GlobalKey<FormState>();

  final sandiLamaController = TextEditingController();
  final sandiBaruController = TextEditingController();
  final konfirmasiController = TextEditingController();

  final isLoading = false.obs;

  final obscureOld = true.obs;
  final obscureNew = true.obs;
  final obscureConfirm = true.obs;

  String? validatorSandiLama(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.oldPasswordRequired.tr;
    }

    return null;
  }

  String? validatorSandiBaru(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.newPasswordRequired.tr;
    }

    if (value.length < 8) {
      return LocaleKeys.passwordMinCharacter.tr;
    }

    if (value == sandiLamaController.text) {
      return LocaleKeys.newPasswordSameAsOld.tr;
    }

    return null;
  }

  String? validatorKonfirmasi(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.confirmNewPasswordRequired.tr;
    }

    if (value != sandiBaruController.text) {
      return LocaleKeys.confirmPasswordMismatch.tr;
    }

    return null;
  }

  Future<void> ubahSandi() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading.value = true;

      final idAkun = await _auth.idAkunSaatIni();

      if (idAkun == null) {
        throw Exception(LocaleKeys.sessionNotFound.tr);
      }

      final akun = await _repositoriAkun.berdasarkanId(idAkun);

      if (akun == null) {
        throw Exception(LocaleKeys.accountNotFound.tr);
      }

      final valid = BCrypt.checkpw(
        sandiLamaController.text.trim(),
        akun.kataSandi,
      );

      if (!valid) {
        AppSnackbar.gagal(
          title: LocaleKeys.anError.tr,
          message: LocaleKeys.oldPasswordIncorrect.tr,
        );
        return;
      }

      final passwordBaru = BCrypt.hashpw(
        sandiBaruController.text.trim(),
        BCrypt.gensalt(),
      );

      await _repositoriAkun.ubahKataSandi(
        id: akun.id,
        passwordBaru: passwordBaru,
      );

      AppSnackbar.sukses(
        title: LocaleKeys.save.tr,
        message: LocaleKeys.passwordChangedSuccess.tr,
      );

      Get.back();
    } catch (e) {
      Get.snackbar(
        LocaleKeys.anError.tr,
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    sandiLamaController.dispose();
    sandiBaruController.dispose();
    konfirmasiController.dispose();
    super.onClose();
  }
}
