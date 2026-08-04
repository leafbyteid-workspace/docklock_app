import 'package:doclock_app/core/theme/app_theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../../../core/errors/app_empty_state.dart';
import '../../../../../../../core/errors/app_toast.dart';
import '../../../../../../../core/helper/date_helper/format_date.dart';
import '../../../../../../../core/utils/responsive_device/responsive_service.dart';
import '../../../../../../../core/widget/action/app_button.dart';
import '../../../../../../../core/widget/action/app_filterChip.dart';
import '../../../../../../../core/widget/input/app_searchfield.dart';
import '../../../../../../../core/widget/list/app_listile.dart';
import '../../../../../../../core/widget/navigation/app_appbar.dart';
import '../../../../../../../localization/locale_keys.dart';
import '../../../../../../data/local/isar/models/riwayat_berkas_model.dart';
import '../../../../../../routes/app_pages.dart';
import '../controllers/index_controller.dart';

class IndexAktivitasView extends GetView<IndexAktivitasController> {
  const IndexAktivitasView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPengguna(
        showBackButton: false,
        title: LocaleKeys.activity.tr,
        subtitle: LocaleKeys.activityDesc.tr,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Responsive.pageWidth(context),
          ),
          child: Padding(
            padding: EdgeInsets.all(
              Responsive.horizontalPadding(context),
            ),
            child: Column(
              children: [
                AppSearchField(
                  controller: controller.searchController,
                  hint: LocaleKeys.searchDocument.tr,
                  onChanged: controller.cari,
                ),
                SizedBox(
                  height: Responsive.textFieldSpacing(context),
                ),
                Obx(
                  () => Wrap(
                    spacing: Responsive.textFieldSpacing(context) / 2,
                    runSpacing: Responsive.textFieldSpacing(context) / 2,
                    children: [
                      SizedBox(
                        width: Responsive.isTablet(context)
                            ? 180
                            : (MediaQuery.of(context).size.width -
                                    (Responsive.horizontalPadding(context) *
                                        2) -
                                    Responsive.textFieldSpacing(context)) /
                                3,
                        child: AppFilterChip(
                          title: LocaleKeys.all.tr,
                          icon: Symbols.grid_view_rounded,
                          selected:
                              controller.filter.value == FilterAktivitas.semua,
                          onTap: () {
                            controller.ubahFilter(FilterAktivitas.semua);
                          },
                        ),
                      ),
                      SizedBox(
                        width: Responsive.isTablet(context)
                            ? 180
                            : (MediaQuery.of(context).size.width -
                                    (Responsive.horizontalPadding(context) *
                                        2) -
                                    Responsive.textFieldSpacing(context)) /
                                3,
                        child: AppFilterChip(
                          title: LocaleKeys.locked.tr,
                          icon: Symbols.lock_rounded,
                          selected: controller.filter.value ==
                              FilterAktivitas.terkunci,
                          onTap: () {
                            controller.ubahFilter(FilterAktivitas.terkunci);
                          },
                        ),
                      ),
                      SizedBox(
                        width: Responsive.isTablet(context)
                            ? 180
                            : (MediaQuery.of(context).size.width -
                                    (Responsive.horizontalPadding(context) *
                                        2) -
                                    Responsive.textFieldSpacing(context)) /
                                3,
                        child: AppFilterChip(
                          title: LocaleKeys.unlocked.tr,
                          icon: Symbols.lock_open,
                          selected: controller.filter.value ==
                              FilterAktivitas.terbuka,
                          onTap: () {
                            controller.ubahFilter(FilterAktivitas.terbuka);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Responsive.textFieldSpacing(context),
                ),
                Expanded(
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return Center(
                        child: LoadingAnimationWidget.inkDrop(
                          color: context.appTheme.primary,
                          size: Responsive.loadingSize(context),
                        ),
                      );
                    }

                    return RefreshIndicator(
                        onRefresh: controller.refreshData,
                        child: controller.daftarRiwayat.isEmpty
                            ? SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: SizedBox(
                                  height: Responsive.height(context) * 0.6,
                                  child: Center(
                                    child: EmptyState(
                                      icon: Symbols.history,
                                      title: LocaleKeys.noActivity.tr,
                                      subtitle: LocaleKeys.noActivityDesc.tr,
                                    ),
                                  ),
                                ),
                              )
                            : ListView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                children: [
                                  ...List.generate(
                                    controller.daftarRiwayat.length,
                                    (index) {
                                      final riwayat =
                                          controller.daftarRiwayat[index];

                                      final berkas = controller.ambilBerkas(
                                        riwayat.idBerkas,
                                      );

                                      return Padding(
                                        padding: EdgeInsets.only(
                                          bottom: Responsive.textFieldSpacing(
                                              context),
                                        ),
                                        child: AppActivityTile(
                                          icon: riwayat.statusRiwayatBerkas ==
                                                  StatusRiwayatBerkas.terkunci
                                              ? Symbols.lock_rounded
                                              : Symbols.lock_open_right_rounded,
                                          title: berkas?.namaBerkasAsli ?? "-",
                                          subtitle: riwayat.keterangan,
                                          date: formatTanggal(
                                            riwayat.dibuatPada,
                                          ),
                                          status: ActivityStatus.sukses,
                                          onTap: () async {
                                            final result = await Get.toNamed(
                                              Routes.detailBerkas,
                                              arguments: riwayat.idBerkas,
                                            );

                                            if (result == true) {
                                              AppToast.sukses(
                                                title: LocaleKeys
                                                    .fileDeletedSuccess.tr,
                                              );

                                              await controller.refreshData();
                                            }
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                  Obx(() {
                                    if (!controller.bisaLoadLagi.value) {
                                      return const SizedBox.shrink();
                                    }

                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: Responsive.textFieldSpacing(
                                            context),
                                      ),
                                      child: Center(
                                        child: AppButton(
                                          text: "5+ Data",
                                          type: AppTipeTombol.secondary,
                                          onPressed: controller.loadMore,
                                        ),
                                      ),
                                    );
                                  }),
                                ],
                              ));
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
