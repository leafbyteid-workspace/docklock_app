import 'package:doclock_app/core/theme/app_theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../../../core/errors/app_empty_state.dart';
import '../../../../../../../core/errors/app_toast.dart';
import '../../../../../../../core/helper/date_helper/format_date.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AppSearchField(
              controller: controller.searchController,
              hint: LocaleKeys.searchDocument.tr,
              onChanged: controller.cari,
            ),
            const SizedBox(height: 16),
            Obx(
              () => Row(
                children: [
                  Expanded(
                    child: AppFilterChip(
                      title: LocaleKeys.all.tr,
                      icon: Symbols.grid_view_rounded,
                      selected:
                          controller.filter.value == FilterAktivitas.semua,
                      onTap: () {
                        controller.ubahFilter(
                          FilterAktivitas.semua,
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: AppFilterChip(
                      title: LocaleKeys.locked.tr,
                      icon: Symbols.lock_rounded,
                      selected:
                          controller.filter.value == FilterAktivitas.terkunci,
                      onTap: () => controller.ubahFilter(
                        FilterAktivitas.terkunci,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: AppFilterChip(
                      title: LocaleKeys.unlocked.tr,
                      icon: Symbols.lock_open,
                      selected:
                          controller.filter.value == FilterAktivitas.terbuka,
                      onTap: () => controller.ubahFilter(
                        FilterAktivitas.terbuka,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: LoadingAnimationWidget.inkDrop(
                      color: context.appTheme.primary,
                      size: 32,
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: controller.refreshData,
                  child: controller.daftarRiwayat.isEmpty
                      ? SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.65,
                            child: Center(
                              child: EmptyState(
                                icon: Symbols.history,
                                title: LocaleKeys.noActivity.tr,
                                subtitle: LocaleKeys.noActivityDesc.tr,
                              ),
                            ),
                          ),
                        )
                      : ListView.separated(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: controller.daftarRiwayat.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          itemBuilder: (_, index) {
                            final riwayat = controller.daftarRiwayat[index];

                            final berkas = controller.ambilBerkas(
                              riwayat.idBerkas,
                            );

                            return AppActivityTile(
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
                                    title: LocaleKeys.fileDeletedSuccess.tr,
                                  );

                                  await controller.refreshData();
                                }
                              },
                            );
                          },
                        ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
