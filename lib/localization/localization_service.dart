import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/data/local/isar/repository/setelan_akun_repository.dart';
import '../app/data/local/isar/services/auth/pengguna/auth_service.dart';
import 'app_locale.dart';
import 'language_item.dart';

class LocalizationService extends GetxService {
  LocalizationService({
    RepositoriSetelanAkun? repositoriSetelan,
    AuthServicePengguna? authService,
  }) : _repositoriSetelan = repositoriSetelan ?? RepositoriSetelanAkun(),
       _authService = authService ?? Get.find<AuthServicePengguna>();

  final RepositoriSetelanAkun _repositoriSetelan;
  final AuthServicePengguna _authService;

  static LocalizationService get to => Get.find();

  final currentLocale = AppLocale.indonesia.obs;

  final languages = [
    const LanguageItem(
      code: "id",
      name: "Bahasa Indonesia",
      flag: "id",
      locale: AppLocale.indonesia,
    ),
    const LanguageItem(
      code: "en",
      name: "English",
      flag: "us",
      locale: AppLocale.english,
    ),
  ];

  Future<LocalizationService> init() async {
    await _loadLocale();

    return this;
  }

  Future<void> _loadLocale() async {
    final idAkun = await _authService.idAkunSaatIni();

    if (idAkun == null) {
      currentLocale.value = AppLocale.indonesia;
      return;
    }

    final setting = await _repositoriSetelan.dapatkanAtauBuat(idAkun);

    currentLocale.value = localeFromCode(setting.bahasa);
  }

  Future<void> changeLocale(String code) async {
    final language = languages.firstWhere(
      (e) => e.code == code,
      orElse: () => languages.first,
    );

    currentLocale.value = language.locale;

    final idAkun = await _authService.idAkunSaatIni();

    if (idAkun != null) {
      await _repositoriSetelan.simpanBahasa(idAkun: idAkun, bahasa: code);
    }

    await Get.updateLocale(language.locale);
  }

  Future<void> changeTemporaryLocale(String code) async {
    final language = languages.firstWhere(
      (e) => e.code == code,
      orElse: () => languages.first,
    );

    currentLocale.value = language.locale;

    await Get.updateLocale(language.locale);
  }

  Future<void> saveCurrentLocaleToAccount() async {
    final idAkun = await _authService.idAkunSaatIni();

    if (idAkun == null) return;

    final code = codeFromLocale(currentLocale.value);

    await _repositoriSetelan.simpanBahasa(idAkun: idAkun, bahasa: code);
  }

  Locale localeFromCode(String code) {
    switch (code) {
      case "en":
        return AppLocale.english;

      case "id":
      default:
        return AppLocale.indonesia;
    }
  }

  String codeFromLocale(Locale locale) {
    return locale.languageCode;
  }

  Future<void> reloadLocale() async {
    await _loadLocale();
    await Get.updateLocale(currentLocale.value);
  }

  Future<void> clearLocale() async {
    currentLocale.value = AppLocale.indonesia;

    await Get.updateLocale(AppLocale.indonesia);
  }
}
