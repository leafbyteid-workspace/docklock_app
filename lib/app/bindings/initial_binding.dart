import 'package:get/get.dart';

import '../../core/theme/app_theme_service.dart';
import '../../core/theme/theme_controller.dart';
import '../../localization/localization_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put<AppwriteDatabaseClient>(
    //   databaseClient,
    //   permanent: true,
    // );
    Get.put(
      ThemeController(),
      permanent: true,
    );

    Get.putAsync<AppThemeService>(
      () async => await AppThemeService().init(),
      permanent: true,
    );
    Get.putAsync<LocalizationService>(
      () async => await LocalizationService().init(),
      permanent: true,
    );
  }
}
