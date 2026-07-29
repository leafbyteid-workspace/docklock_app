import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../../../core/widget/input/app_searchfield.dart';
import '../../../../../../../core/widget/list/app_listile.dart';
import '../../../../../../../core/widget/navigation/app_appbar.dart';
import '../controllers/index_controller.dart';

class IndexAktivitasView extends GetView<IndexAktivitasController> {
  const IndexAktivitasView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPengguna(
        showBackButton: false,
        title: "Aktivitas",
        subtitle: "Riwayat Semua Proses Aktivitas Keamanan Dokumen",
        actionIcon1: Symbols.more_vert_rounded,
        onAction1: () {},
        onBackPressed: () => Get.back(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const AppSearchField(
              hint: "Cari dokumen...",
              // controller: controller.searchController,
              // onChanged: controller.search,
              // onFilterTap: controller.openFilter,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: 8,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return AppActivityTile(
                    icon: Symbols.description_rounded,
                    title: "Dokumen Perjanjian.pdf",
                    subtitle: "Verifikasi tanda tangan digital",
                    date: "20 Jul 2026",
                    status: switch (index % 3) {
                      0 => ActivityStatus.success,
                      1 => ActivityStatus.processing,
                      _ => ActivityStatus.failed,
                    },
                    onTap: () {
                      // Detail aktivitas
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
