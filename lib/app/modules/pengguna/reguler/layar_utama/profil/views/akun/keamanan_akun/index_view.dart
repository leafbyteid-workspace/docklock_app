import 'package:doclock_app/core/theme/app_theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../../../../../core/constants/app_typography.dart';
import '../../../../../../../../../core/layout/pengguna/profil/app_profilemenusection.dart';
import '../../../../../../../../../core/layout/pengguna/profil/app_proflemenu.dart';
import '../../../../../../../../../core/widget/input/app_dialogfield.dart';
import '../../../../../../../../../core/widget/navigation/app_appbar.dart';
import '../../../../../../../../../localization/locale_keys.dart';
import '../../../../../../../../routes/app_pages.dart';
import '../../../controllers/akun/keamanan_akun/index_controller.dart';

class IndexAkunKeamananAkunView
    extends GetView<IndexAkunKeamananAkunController> {
  const IndexAkunKeamananAkunView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.background,
      appBar: AppBarPengguna(
        title: LocaleKeys.security.tr,
        onBackPressed: Get.back,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24,
        ),
        children: [
          Text(
            LocaleKeys.security.tr,
            style: AppTypography.title2().copyWith(
              color: context.appTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            LocaleKeys.accountSecurityDesc.tr,
            style: AppTypography.bodySmall().copyWith(
              color: context.appTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 28),
          AppProfileMenuSection(
            title: LocaleKeys.password.tr,
            children: [
              AppProfileMenuTile(
                icon: Symbols.lock_reset_rounded,
                title: LocaleKeys.changePassword.tr,
                subtitle: LocaleKeys.changePasswordDesc.tr,
                onTap: () {
                  Get.toNamed(Routes.indexKeamananAkunUbahSandi);
                },
              ),
            ],
          ),
          AppProfileMenuSection(
            title: LocaleKeys.session.tr,
            children: [
              AppProfileMenuTile(
                icon: Symbols.delete_forever_rounded,
                iconColor: Colors.red,
                textColor: Colors.red,
                title: "Delete Account",
                subtitle:
                    "Permanently delete your account and all associated data.",
                onTap: () {
                  Get.dialog(
                    AppDeleteAccountDialog(
                      onDelete: controller.hapusAkun,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
