import 'package:get/get.dart';

import '../localization_service.dart';

class TemporaryLanguageController extends GetxController {
  final localization = LocalizationService.to;

  final selectedLanguage = "id".obs;

  final languages = [
    const {"code": "id", "name": "Bahasa Indonesia", "flag": "🇮🇩"},
    const {"code": "en", "name": "English", "flag": "🇺🇸"},
  ];

  @override
  void onInit() {
    super.onInit();

    selectedLanguage.value = localization.codeFromLocale(
      localization.currentLocale.value,
    );
  }

  Future<void> changeLanguage(String code) async {
    if (selectedLanguage.value == code) {
      return;
    }

    selectedLanguage.value = code;

    await localization.changeTemporaryLocale(code);
  }
}
