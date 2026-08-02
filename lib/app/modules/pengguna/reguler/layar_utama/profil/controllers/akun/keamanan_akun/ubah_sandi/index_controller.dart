import 'package:bcrypt/bcrypt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../core/errors/app_snackbar.dart';
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

  @override
  void onClose() {
    sandiLamaController.dispose();
    sandiBaruController.dispose();
    konfirmasiController.dispose();
    super.onClose();
  }

  Future<void> ubahSandi() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading.value = true;

      final idAkun = await _auth.idAkunSaatIni();

      if (idAkun == null) {
        throw Exception("Sesi tidak ditemukan");
      }

      final akun = await _repositoriAkun.berdasarkanId(idAkun);

      if (akun == null) {
        throw Exception("Akun tidak ditemukan");
      }

      final valid = BCrypt.checkpw(
        sandiLamaController.text.trim(),
        akun.kataSandi,
      );

      if (!valid) {
        AppSnackbar.gagal(
            title: "Terjadi Kesalahan",
            message: "Kata Sandi Lama Tidak Sesuai!");
        return;
      }

      final passwordBaru =
          BCrypt.hashpw(sandiBaruController.text.trim(), BCrypt.gensalt());

      await _repositoriAkun.ubahKataSandi(
        id: akun.id,
        passwordBaru: passwordBaru,
      );

      AppSnackbar.sukses(
          title: "Berhasil", message: "Kata Sandi Berhasil Di Perbarui");

      Get.back();
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  String? validatorSandiLama(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Password lama wajib diisi";
    }

    return null;
  }

  String? validatorSandiBaru(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Password baru wajib diisi";
    }

    if (value.length < 8) {
      return "Minimal 8 karakter";
    }

    if (value == sandiLamaController.text) {
      return "Password baru tidak boleh sama";
    }

    return null;
  }

  String? validatorKonfirmasi(String? value) {
    if (value == null || value.isEmpty) {
      return "Konfirmasi password wajib diisi";
    }

    if (value != sandiBaruController.text) {
      return "Konfirmasi password tidak sesuai";
    }

    return null;
  }
}
