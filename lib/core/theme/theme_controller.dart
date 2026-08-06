import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/data/local/isar/models/setelan_akun_model.dart';
import '../../app/data/local/isar/repository/setelan_akun_repository.dart';

class ThemeController extends GetxController {
  ThemeController({
    RepositoriSetelanAkun? repositori,
  }) : _repositori = repositori ?? RepositoriSetelanAkun();

  final RepositoriSetelanAkun _repositori;

  final Rx<TemaAplikasi> tema = TemaAplikasi.sistem.obs;

  ThemeMode get themeMode {
    switch (tema.value) {
      case TemaAplikasi.terang:
        return ThemeMode.light;

      case TemaAplikasi.gelap:
        return ThemeMode.dark;
        
      case TemaAplikasi.sistem:
        return ThemeMode.system;
    }
  }

  Future<void> load(int idAkun) async {
    final setting = await _repositori.dapatkanAtauBuat(idAkun);

    tema.value = setting.tema;

    Get.changeThemeMode(themeMode);
  }

  Future<void> changeTheme(
    int idAkun,
    TemaAplikasi value,
  ) async {
    if (tema.value == value) {
      return;
    }

    tema.value = value;

    Get.changeThemeMode(themeMode);

    await _repositori.simpanTema(
      idAkun: idAkun,
      tema: value,
    );
  }

  void reset() {
    tema.value = TemaAplikasi.sistem;

    Get.changeThemeMode(
      ThemeMode.system,
    );
  }
}