import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/data/local/isar/models/setelan_akun_model.dart';
import '../../app/data/local/isar/repository/setelan_akun_repository.dart';
import '../../app/data/local/isar/services/auth/pengguna/auth_service.dart';

class AppThemeService extends GetxService {
  AppThemeService({
    RepositoriSetelanAkun? repositori,
    AuthServicePengguna? authService,
  })  : _repositori = repositori ?? RepositoriSetelanAkun(),
        _authService = authService ?? Get.find<AuthServicePengguna>();

  final RepositoriSetelanAkun _repositori;
  final AuthServicePengguna _authService;

  final Rx<TemaAplikasi> tema = TemaAplikasi.sistem.obs;
  final RxBool isReady = false.obs;

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

  bool get isDark => tema.value == TemaAplikasi.gelap;

  bool get isLight => tema.value == TemaAplikasi.terang;

  bool get isSystem => tema.value == TemaAplikasi.sistem;

  Future<AppThemeService> init() async {
    await muatTema();

    isReady.value = true;

    return this;
  }

  Future<void> muatTema() async {
    final sesi = await _authService.sesiSaatIni();

    if (sesi == null) {
      _setTheme(
        TemaAplikasi.sistem,
        save: false,
      );

      return;
    }

    final setting = await _repositori.dapatkanAtauBuat(sesi.idAkun);

    _setTheme(
      setting.tema,
      save: false,
    );
  }

  Future<void> ubahTema(
    TemaAplikasi value,
  ) async {
    if (tema.value == value) {
      return;
    }

    tema.value = value;

    _applyThemeMode(value);

    final sesi = await _authService.sesiSaatIni();

    if (sesi == null) {
      return;
    }

    await _repositori.simpanTema(
      idAkun: sesi.idAkun,
      tema: value,
    );
  }

  Future<void> reset() async {
    _setTheme(
      TemaAplikasi.sistem,
      save: false,
    );
  }

  void _setTheme(
    TemaAplikasi value, {
    bool save = false,
  }) {
    tema.value = value;

    _applyThemeMode(value);

    if (!save) {
      return;
    }

    ubahTema(value);
  }

  void _applyThemeMode(
    TemaAplikasi value,
  ) {
    switch (value) {
      case TemaAplikasi.sistem:
        Get.changeThemeMode(
          ThemeMode.system,
        );
        break;

      case TemaAplikasi.terang:
        Get.changeThemeMode(
          ThemeMode.light,
        );
        break;

      case TemaAplikasi.gelap:
        Get.changeThemeMode(
          ThemeMode.dark,
        );
        break;
    }
  }

  Future<void> clearTheme() async {
    tema.value = TemaAplikasi.terang;

    Get.changeThemeMode(ThemeMode.light);

    isReady.value = false;
  }
}
