import 'package:get/get.dart';

import '../../../app/data/local/isar/models/pengguna_model.dart';
import '../../../localization/locale_keys.dart';

extension JenisKelaminExtension on JenisKelamin {
  String get text {
    switch (this) {
      case JenisKelamin.pria:
        return LocaleKeys.genderMale.tr;

      case JenisKelamin.wanita:
        return LocaleKeys.genderFemale.tr;

      case JenisKelamin.belumDiisi:
        return LocaleKeys.genderNotFilled.tr;
    }
  }
}
