import 'package:doclock_app/core/errors/app_snackbar.dart';
import 'package:doclock_app/core/errors/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../../../../../core/utils/security/app_password_hasher.dart';
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
      return "Nama lengkap wajib diisi.";
    }

    if (value.trim().length < 3) {
      return "Minimal 3 karakter.";
    }

    return null;
  }

  String? validasiNamaPengguna(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Nama pengguna wajib diisi.";
    }

    if (value.contains(" ")) {
      return "Nama pengguna tidak boleh mengandung spasi.";
    }

    if (value.length < 4) {
      return "Minimal 4 karakter.";
    }

    return null;
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

  String? validasiKonfirmasiKataSandi(String? value) {
    if (value == null || value.isEmpty) {
      return "Konfirmasi kata sandi wajib diisi.";
    }

    if (value != kataSandiController.text) {
      return "Konfirmasi kata sandi tidak sama.";
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
        AppSnackbar.sukses(
          title: "Email Sudah Tersedia",
          message: "Gunakan Alamat Email Unik Lainnya!",
        );
        return;
      }

      final penggunaSudahAda =
          await _repositoriPengguna.namaPenggunaSudahDigunakan(
        namaPengguna,
      );

      if (penggunaSudahAda) {
        AppSnackbar.sukses(
          title: "Pengguna Sudah Tersedia",
          message: "Gunakan Nama Pengguna Unik Lainnya!",
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

      AppToast.sukses(title: "Pendaftaraan Berhasil");
    } catch (e) {
      AppSnackbar.gagal(
        title: "Terjadi Kesalahan",
        message: "Pendaftaran Akun Gagal, Silahkan Coba Lagi!",
      );
      print(e);
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
