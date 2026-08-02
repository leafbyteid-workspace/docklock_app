import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_locale.dart';
import 'language_item.dart';

class LocalizationService extends GetxService {
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
    currentLocale.value = AppLocale.indonesia;
    return this;
  }

  Future<void> changeLocale(String code) async {
    final language = languages.firstWhere(
      (e) => e.code == code,
      orElse: () => languages.first,
    );

    currentLocale.value = language.locale;

    await Get.updateLocale(language.locale);
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
}
