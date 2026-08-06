import 'package:doclock_app/core/errors/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../core/widget/input/app_dialogfield.dart';
import '../../../../../../../../../localization/locale_keys.dart';
import '../../../../../../../../data/local/isar/models/akun_model.dart';
import '../../../../../../../../data/local/isar/models/pengguna_model.dart';
import '../../../../../../../../data/local/isar/repository/akun_repository.dart';
import '../../../../../../../../data/local/isar/repository/pengguna_repository.dart';
import '../../../../../../../../data/local/isar/services/auth/pengguna/auth_service.dart';

class IndexAkunInformasiPribadiController extends GetxController {
  IndexAkunInformasiPribadiController({
    RepositoriPengguna? repositoriPengguna,
    RepositoriAkun? repositoriAkun,
  }) : _repositoriPengguna = repositoriPengguna ?? RepositoriPengguna(),
       _repositoriAkun = repositoriAkun ?? RepositoriAkun();

  final AuthServicePengguna _auth = Get.find<AuthServicePengguna>();

  final RepositoriPengguna _repositoriPengguna;
  final RepositoriAkun _repositoriAkun;

  final isLoading = true.obs;

  final pengguna = Rxn<PenggunaModel>();
  final akun = Rxn<AkunModel>();

  @override
  void onInit() {
    super.onInit();
    memuatData();
  }

  Future<void> refreshData() async {
    await memuatData();
  }

  Future<void> memuatData() async {
    try {
      isLoading.value = true;

      final id = await _auth.penggunaSaatIni();

      pengguna.value = await _repositoriPengguna.berdasarkanId(id);
      akun.value = await _repositoriAkun.berdasarkanIdPengguna(id);
    } finally {
      isLoading.value = false;
    }
  }

  Future<String?> _showInputDialog({
    required String title,
    String? subtitle,
    required String hintText,
    String? initialValue,
    IconData? icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    int maxLines = 1,
    String? Function(String value)? validator,
  }) {
    return Get.dialog<String>(
      AppInputDialog(
        title: title,
        subtitle: subtitle,
        hintText: hintText,
        initialValue: initialValue,
        icon: icon,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLines: maxLines,
        validator: validator,
      ),
    );
  }

  Future<void> editNamaLengkap() async {
    final result = await _showInputDialog(
      title: LocaleKeys.fullName.tr,
      subtitle: LocaleKeys.enterFullNameDesc.tr,
      hintText: LocaleKeys.fullName.tr,
      initialValue: pengguna.value?.namaLengkap,
      icon: Icons.badge_outlined,
      validator: (value) {
        if (value.isEmpty) {
          return LocaleKeys.fullNameRequired.tr;
        }

        if (value.length < 3) {
          return LocaleKeys.fullNameMinLength.tr;
        }

        return null;
      },
    );

    if (result == null) return;

    await _repositoriPengguna.ubahData(
      id: pengguna.value!.id,
      namaLengkap: result,
    );

    await memuatData();
  }

  Future<void> editNamaPengguna() async {
    final result = await _showInputDialog(
      title: LocaleKeys.userName.tr,
      subtitle: LocaleKeys.usernameDialogDesc.tr,
      hintText: LocaleKeys.userName.tr,
      initialValue: pengguna.value?.namaPengguna,
      icon: Icons.person_outline,
      validator: (value) {
        if (value.isEmpty) {
          return LocaleKeys.usernameRequired.tr;
        }

        if (value.length < 4) {
          return LocaleKeys.usernameMinLength.tr;
        }

        return null;
      },
    );

    if (result == null) return;

    final sudahDipakai = await _repositoriPengguna.namaPenggunaSudahDigunakan(
      result,
    );

    if (sudahDipakai && result != pengguna.value!.namaPengguna) {
      AppSnackbar.gagal(
        title: LocaleKeys.anError.tr,
        message: LocaleKeys.usernameAlreadyExistsDesc.tr,
      );
      return;
    }

    await _repositoriPengguna.ubahData(
      id: pengguna.value!.id,
      namaPengguna: result,
    );

    await memuatData();
  }

  Future<void> editEmail() async {
    final result = await _showInputDialog(
      title: LocaleKeys.email.tr,
      subtitle: LocaleKeys.emailDialogDesc.tr,
      hintText: LocaleKeys.email.tr,
      initialValue: akun.value?.email,
      icon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isEmpty) {
          return LocaleKeys.emailRequired.tr;
        }

        if (!GetUtils.isEmail(value)) {
          return LocaleKeys.invalidEmailFormat.tr;
        }

        return null;
      },
    );

    if (result == null) return;

    final sudahDipakai = await _repositoriAkun.emailSudahDigunakan(result);

    if (sudahDipakai && result != akun.value!.email) {
      AppSnackbar.gagal(
        title: LocaleKeys.anError.tr,
        message: LocaleKeys.emailAlreadyExistsDesc.tr,
      );
      return;
    }

    akun.value!.email = result;
    await _repositoriAkun.simpan(akun.value!);

    await memuatData();
  }

  Future<void> editUsia() async {
    final result = await _showInputDialog(
      title: LocaleKeys.age.tr,
      subtitle: LocaleKeys.ageDialogDesc.tr,
      hintText: LocaleKeys.ageHint.tr,
      initialValue: pengguna.value?.usia?.toString(),
      icon: Icons.cake_outlined,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value.isEmpty) {
          return LocaleKeys.ageRequired.tr;
        }

        final usia = int.tryParse(value);

        if (usia == null) {
          return LocaleKeys.ageMustBeNumber.tr;
        }

        if (usia < 1 || usia > 120) {
          return LocaleKeys.ageInvalid.tr;
        }

        return null;
      },
    );

    if (result == null) return;

    await _repositoriPengguna.ubahData(
      id: pengguna.value!.id,
      usia: int.parse(result),
    );

    await memuatData();
  }

  Future<void> editJenisKelamin() async {
    final hasil = await Get.dialog<JenisKelamin>(
      AppSelectionDialog(
        title: LocaleKeys.gender.tr,
        subtitle: LocaleKeys.genderDialogDesc.tr,
        icon: Icons.wc_outlined,
        initialValue: pengguna.value?.jenisKelamin,
      ),
    );
    if (hasil == null) return;

    await _repositoriPengguna.ubahData(
      id: pengguna.value!.id,
      jenisKelamin: hasil,
    );

    await memuatData();
  }
}
