import 'package:get/get.dart';

import '../../../../../../../../../localization/app_locale.dart';
import '../../../../../../../../../localization/language_item.dart';
import '../../../../../../../../../localization/localization_service.dart';

class IndexPreferensiBahasaController extends GetxController {
  final localization = LocalizationService.to;

  final selectedLanguage = "id".obs;
  final isLoading = false.obs;

  final languages = const [
    LanguageItem(
      code: "id",
      name: "Bahasa Indonesia",
      flag: "🇮🇩",
      locale: AppLocale.indonesia,
    ),
    LanguageItem(
      code: "en",
      name: "English",
      flag: "🇺🇸",
      locale: AppLocale.english,
    ),
  ];

  @override
  void onInit() {
    super.onInit();

    selectedLanguage.value =
        localization.codeFromLocale(localization.currentLocale.value);
  }

  Future<void> pilihBahasa(String code) async {
    if (selectedLanguage.value == code) return;

    selectedLanguage.value = code;

    await localization.changeLocale(code);
  }
}
