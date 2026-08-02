import 'package:get/get.dart';

import '../../../../../../../../../localization/app_locale.dart';
import '../../../../../../../../../localization/language_item.dart';
import '../../../../../../../../data/local/isar/repository/setelan_akun_repository.dart';
import '../../../../../../../../data/local/isar/services/auth/pengguna/auth_service.dart';

class IndexPreferensiBahasaController extends GetxController {
  IndexPreferensiBahasaController({
    RepositoriSetelanAkun? repositoriSetelan,
    AuthServicePengguna? authService,
  })  : _repositoriSetelan = repositoriSetelan ?? RepositoriSetelanAkun(),
        _authService = authService ?? Get.find<AuthServicePengguna>();

  final RepositoriSetelanAkun _repositoriSetelan;
  final AuthServicePengguna _authService;

  final isLoading = false.obs;
  final selectedLanguage = "id".obs;
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
    membuatBahasa();
  }

  Future<void> membuatBahasa() async {
    isLoading.value = true;

    try {
      final idAkun = await _authService.idAkunSaatIni();

      if (idAkun == null) return;

      final setting = await _repositoriSetelan.dapatkanAtauBuat(idAkun);

      selectedLanguage.value = setting.bahasa;

      final language = languages.firstWhere(
        (e) => e.code == setting.bahasa,
        orElse: () => languages.first,
      );

      Get.updateLocale(language.locale);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> pilihBahasa(String code) async {
    if (selectedLanguage.value == code) return;

    final idAkun = await _authService.idAkunSaatIni();
    if (idAkun == null) return;

    final language = languages.firstWhere((e) => e.code == code);

    selectedLanguage.value = code;

    await _repositoriSetelan.simpanBahasa(
      idAkun: idAkun,
      bahasa: code,
    );

    Get.updateLocale(language.locale);
  }
}
