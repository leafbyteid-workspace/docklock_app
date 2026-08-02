import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../../../core/constants/app_color.dart';
import '../../../../../../../core/constants/app_typography.dart';
import '../../../../../../../core/layout/pengguna/profil/app_profilecard.dart';
import '../../../../../../../core/layout/pengguna/profil/app_profilemenusection.dart';
import '../../../../../../../core/layout/pengguna/profil/app_proflemenu.dart';
import '../../../../../../../core/widget/navigation/app_appbar.dart';
import '../../../../../../../localization/locale_keys.dart';
import '../../../../../../routes/app_pages.dart';
import '../controllers/index_controller.dart';

class IndexProfilPenggunaView extends GetView<IndexProfilPenggunaController> {
  const IndexProfilPenggunaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPengguna(
        showBackButton: false,
        title: LocaleKeys.myProfile.tr,
        subtitle: LocaleKeys.manageAccount.tr,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.refreshData();
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Obx(() {
              if (controller.isLoading.value) {
                return Center(
                  child: LoadingAnimationWidget.inkDrop(
                    color: AppColor.primary,
                    size: 32,
                  ),
                );
              }

              final pengguna = controller.pengguna.value;

              if (pengguna == null) {
                return const SizedBox.shrink();
              }

              return AppProfileCard(
                title: pengguna.namaLengkap,
                subtitle: controller.email.value,
                status: LocaleKeys.active.tr,
                caption: "@${pengguna.namaPengguna}",
                statusColor: const Color(0xFF16A34A),
                onTap: () {},
              );
            }),
            const SizedBox(height: 24),
            AppProfileMenuSection(
              title: LocaleKeys.account.tr,
              children: [
                AppProfileMenuTile(
                  icon: Symbols.person_rounded,
                  title: LocaleKeys.personalInformation.tr,
                  subtitle: LocaleKeys.personalInformationDesc.tr,
                  onTap: () async {
                    await Get.toNamed(Routes.indexAkunInformasiPribadi);

                    await controller.refreshData();
                  },
                ),
                AppProfileMenuTile(
                  icon: Symbols.lock_rounded,
                  title: LocaleKeys.accountSecurity.tr,
                  subtitle: LocaleKeys.accountSecurityDesc.tr,
                  showDivider: false,
                  onTap: () async {
                    await Get.toNamed(Routes.indexAkunKeamananAkun);

                    await controller.refreshData();
                  },
                ),
              ],
            ),
            AppProfileMenuSection(
              title: LocaleKeys.preference.tr,
              children: [
                AppProfileMenuTile(
                  icon: Symbols.dark_mode_rounded,
                  title: LocaleKeys.theme.tr,
                  subtitle: LocaleKeys.themeDesc.tr,
                  onTap: () async {
                    await Get.toNamed(Routes.indexPreferensiTema);

                    await controller.refreshData();
                  },
                ),
                AppProfileMenuTile(
                  icon: Symbols.language_rounded,
                  title: LocaleKeys.language.tr,
                  subtitle: LocaleKeys.languageDesc.tr,
                  showDivider: false,
                  onTap: () async {
                    await Get.toNamed(Routes.indexPreferensiBahasa);

                    await controller.refreshData();
                  },
                ),
              ],
            ),
            AppProfileMenuSection(
              title: LocaleKeys.help.tr,
              children: [
                AppProfileMenuTile(
                  icon: Symbols.privacy_tip_rounded,
                  title: LocaleKeys.privacyPolicy.tr,
                  subtitle: LocaleKeys.privacyPolicyDesc.tr,
                  onTap: () async {
                    await Get.toNamed(Routes.indexKebijakanPrivasi);

                    await controller.refreshData();
                  },
                ),
                AppProfileMenuTile(
                  icon: Symbols.gavel_rounded,
                  title: LocaleKeys.terms.tr,
                  subtitle: LocaleKeys.termsDesc.tr,
                  onTap: () async {
                    await Get.toNamed(Routes.indexSyaratdanKetentuan);

                    await controller.refreshData();
                  },
                ),
                // AppProfileMenuTile(
                //   icon: Symbols.star_rate_rounded,
                //   title: LocaleKeys.rateApp.tr,
                //   subtitle: LocaleKeys.rateAppDesc.tr,
                //   onTap: () {},
                // ),
                AppProfileMenuTile(
                  icon: Symbols.feedback_rounded,
                  title: LocaleKeys.feedback.tr,
                  subtitle: LocaleKeys.feedbackDesc.tr,
                  onTap: () {},
                ),
                AppProfileMenuTile(
                  icon: Symbols.info_rounded,
                  title: LocaleKeys.aboutApp.tr,
                  subtitle: LocaleKeys.aboutAppDesc.tr,
                  showDivider: false,
                  onTap: () async {
                    await Get.toNamed(Routes.indexTentangAplikasi);

                    await controller.refreshData();
                  },
                ),
              ],
            ),
            AppProfileMenuSection(
              title: LocaleKeys.session.tr,
              children: [
                AppProfileMenuTile(
                  icon: Symbols.logout_rounded,
                  iconColor: Colors.red,
                  textColor: Colors.red,
                  title: LocaleKeys.logout.tr,
                  subtitle: LocaleKeys.logoutDesc.tr,
                  showDivider: false,
                  onTap: () {
                    controller.keluar(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                "Doclock\nVersi 1.0.0",
                textAlign: TextAlign.center,
                style: AppTypography.footnote().copyWith(
                  color: AppColor.textSecondary,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
