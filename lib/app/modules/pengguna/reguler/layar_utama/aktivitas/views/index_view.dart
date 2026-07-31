import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../../../core/constants/app_color.dart';
import '../../../../../../../core/constants/app_typography.dart';
import '../../../../../../../core/errors/app_empty_state.dart';
import '../../../../../../../core/widget/action/app_filterChip.dart';
import '../../../../../../../core/widget/input/app_searchfield.dart';
import '../../../../../../../core/widget/list/app_listile.dart';
import '../../../../../../../core/widget/navigation/app_appbar.dart';
import '../../../../../../data/local/isar/models/riwayat_berkas_model.dart';
import '../controllers/index_controller.dart';

class IndexAktivitasView extends GetView<IndexAktivitasController> {
  const IndexAktivitasView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPengguna(
        showBackButton: false,
        title: "Aktivitas",
        subtitle: "Riwayat Semua Proses Aktivitas Keamanan Dokumen",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AppSearchField(
              controller: controller.searchController,
              hint: "Cari dokumen...",
              onChanged: controller.cari,
            ),
            const SizedBox(height: 16),
            Obx(
              () => Row(
                children: [
                  Expanded(
                    child: AppFilterChip(
                      title: 'Semua',
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
                      title: 'Terkunci',
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
                      title: 'Terbuka',
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
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return RefreshIndicator(
                  onRefresh: controller.refreshData,
                  child: controller.daftarRiwayat.isEmpty
                      ? SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.65,
                            child: const Center(
                              child: EmptyState(
                                icon: Symbols.history,
                                title: "Belum Ada Aktivitas",
                                subtitle:
                                    "Riwayat Enkripsi dan Dekripsi akan muncul di sini.",
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
                              date: DateFormat(
                                "dd MMM yyyy • HH:mm",
                              ).format(
                                riwayat.dibuatPada,
                              ),
                              status: ActivityStatus.sukses,
                              onTap: () {},
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

class _FilterChipAktivitas extends StatelessWidget {
  const _FilterChipAktivitas({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: selected ? AppColor.primary : AppColor.surfaceVariant,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: selected ? AppColor.primary : AppColor.borderDefault,
          width: 1.0,
        ),
        boxShadow: selected
            ? [
                BoxShadow(
                  color: AppColor.primary.withOpacity(0.25),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100),
          highlightColor:
              selected ? AppColor.hover.withOpacity(0.2) : AppColor.hover,
          splashColor:
              selected ? AppColor.pressed.withOpacity(0.2) : AppColor.pressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              title,
              style: AppTypography.chip.copyWith(
                color: selected ? AppColor.onPrimary : AppColor.textSecondary,
                fontWeight:
                    selected ? AppTypography.semiBold : AppTypography.medium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
