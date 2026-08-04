import 'package:doclock_app/core/theme/app_theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../../../core/errors/app_empty_state.dart';
import '../../../../../../../core/helper/date_helper/format_date.dart';
import '../../../../../../../core/layout/app_section_header.dart';
import '../../../../../../../core/utils/responsive_device/responsive_service.dart';
import '../../../../../../../core/widget/card/app_feature_card.dart';
import '../../../../../../../core/widget/card/app_summary_card.dart';
import '../../../../../../../core/widget/list/app_listile.dart';
import '../../../../../../../core/widget/navigation/app_appbar.dart';
import '../../../../../../../localization/locale_keys.dart';
import '../../../../../../data/local/isar/models/riwayat_aktivitas_model.dart';
import '../../../../../../routes/app_pages.dart';
import '../controllers/index_controller.dart';

class IndexBerandaView extends GetView<IndexBerandaController> {
  const IndexBerandaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.background,
      appBar: AppBarPengguna(
        backgroundColor: context.appTheme.primary,
        showBackButton: false,
        title: LocaleKeys.home.tr,
        subtitle: LocaleKeys.homeDesc.tr,
      ),
      body: RefreshIndicator(
        onRefresh: controller.refreshData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.horizontalPadding(context),
            vertical: Responsive.textFieldSpacing(context),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: Responsive.pageWidth(context),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Responsive.isTablet(context) || Responsive.isDesktop(context)
                      ? Row(
                          children: [
                            Expanded(
                              child: AppFeatureCard(
                                layout: AppTataLetakKartuFitur.horizontal,
                                label: LocaleKeys.security.tr,
                                title: LocaleKeys.lockFiles.tr,
                                description: LocaleKeys.lockFilesDesc.tr,
                                backgroundIcon: Symbols.lock,
                                actionText: LocaleKeys.startlockFiles.tr,
                                onTap: () {
                                  Get.toNamed(Routes.indexKunciBerkas);
                                },
                              ),
                            ),
                            SizedBox(
                              width: Responsive.textFieldSpacing(context),
                            ),
                            Expanded(
                              child: AppFeatureCard(
                                layout: AppTataLetakKartuFitur.horizontal,
                                label: LocaleKeys.dataAccess.tr,
                                title: LocaleKeys.unlockFiles.tr,
                                description: LocaleKeys.unlockFilesDesc.tr,
                                backgroundIcon: Symbols.lock_open,
                                actionText: LocaleKeys.startunlockFiles.tr,
                                onTap: () {
                                  Get.toNamed(Routes.indexBukaKunciBerkas);
                                },
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            AppFeatureCard(
                              layout: AppTataLetakKartuFitur.horizontal,
                              label: LocaleKeys.security.tr,
                              title: LocaleKeys.lockFiles.tr,
                              description: LocaleKeys.lockFilesDesc.tr,
                              backgroundIcon: Symbols.lock,
                              actionText: LocaleKeys.startlockFiles.tr,
                              onTap: () {
                                Get.toNamed(Routes.indexKunciBerkas);
                              },
                            ),
                            SizedBox(
                              height: Responsive.textFieldSpacing(context),
                            ),
                            AppFeatureCard(
                              layout: AppTataLetakKartuFitur.horizontal,
                              label: LocaleKeys.dataAccess.tr,
                              title: LocaleKeys.unlockFiles.tr,
                              description: LocaleKeys.unlockFilesDesc.tr,
                              backgroundIcon: Symbols.lock_open,
                              actionText: LocaleKeys.startunlockFiles.tr,
                              onTap: () {
                                Get.toNamed(Routes.indexBukaKunciBerkas);
                              },
                            ),
                          ],
                        ),
                  SizedBox(
                    height: Responsive.sectionSpacing(context),
                  ),
                  AppSectionHeader(
                    title: LocaleKeys.activitySummary.tr,
                  ),
                  SizedBox(
                    height: Responsive.textFieldSpacing(context) / 2,
                  ),
                  Obx(
                    () => AppSummaryCard(
                      items: [
                        AppItemRingkasan(
                          icon: Symbols.lock,
                          count: controller.totalEnkripsi.value.toString(),
                          title: LocaleKeys.locked.tr,
                          subtitle: LocaleKeys.total.tr,
                        ),
                        AppItemRingkasan(
                          icon: Symbols.folder,
                          count: controller.totalDokumen.value.toString(),
                          title: LocaleKeys.documents.tr,
                          subtitle: LocaleKeys.stored.tr,
                        ),
                        AppItemRingkasan(
                          icon: Symbols.lock_open,
                          count: controller.totalDekripsi.value.toString(),
                          title: LocaleKeys.unlocked.tr,
                          subtitle: LocaleKeys.successful.tr,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Responsive.sectionSpacing(context),
                  ),
                  AppSectionHeader(
                    title: LocaleKeys.latestActivity.tr,
                  ),
                  SizedBox(
                    height: Responsive.textFieldSpacing(context) / 2,
                  ),
                  Obx(() {
                    if (controller.loadingAktivitas.value) {
                      return Center(
                        child: LoadingAnimationWidget.inkDrop(
                          color: context.appTheme.primary,
                          size: Responsive.loadingSize(context),
                        ),
                      );
                    }

                    if (controller.aktivitasTerbaru.isEmpty) {
                      return EmptyState(
                        icon: Symbols.history,
                        title: LocaleKeys.noActivity.tr,
                        subtitle: LocaleKeys.noActivityDesc.tr,
                      );
                    }

                    return Column(
                      children: controller.aktivitasTerbaru.map((aktivitas) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: Responsive.textFieldSpacing(context) / 2,
                          ),
                          child: AppActivityTile(
                            icon: Symbols.history_2_rounded,
                            title: aktivitas.judulAktivitas,
                            subtitle: aktivitas.deskripsi,
                            date: formatTanggal(
                              aktivitas.dibuatPada,
                            ),
                            status: aktivitas.statusAktivitas ==
                                    StatusAktivitas.berhasil
                                ? ActivityStatus.sukses
                                : ActivityStatus.gagal,
                          ),
                        );
                      }).toList(),
                    );
                  }),
                  SizedBox(
                    height: Responsive.textFieldSpacing(context),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
