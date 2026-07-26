import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexMasukPenggunaController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;
  final selectedGender = Rxn<String>();
  final namaLengkapController = TextEditingController();
  final emailController = TextEditingController();
  final kataSandiController = TextEditingController();
  final konfirmasiKataSandiController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    namaLengkapController.dispose();
    emailController.dispose();
    kataSandiController.dispose();
    konfirmasiKataSandiController.dispose();
    super.onClose();
  }

  String? validasiEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email wajib diisi";
    }

    if (!GetUtils.isEmail(value.trim())) {
      return "Format email tidak valid";
    }

    return null;
  }

  String? validasiKataSandi(String? value) {
    if (value == null || value.isEmpty) {
      return "Kata sandi wajib diisi";
    }

    if (value.length < 8) {
      return "Minimal 8 karakter";
    }

    return null;
  }


  Future<void> masukPengguna() async {
    if (!formKey.currentState!.validate()) return;

    if (selectedGender.value == null) {
      Get.snackbar(
        "Peringatan",
        "Silakan pilih jenis kelamin.",
      );
      return;
    }

    isLoading.value = true;

    try {
      await Future.delayed(const Duration(seconds: 2));

      Get.snackbar(
        "Berhasil",
        "Pendaftaran berhasil.",
      );
    } catch (e) {
      Get.snackbar(
        "Gagal",
        e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
