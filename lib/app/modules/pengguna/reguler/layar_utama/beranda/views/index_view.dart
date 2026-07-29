import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../../../core/constants/app_color.dart';
import '../../../../../../../core/layout/app_section_header.dart';
import '../../../../../../../core/widget/card/app_feature_card.dart';
import '../../../../../../../core/widget/card/app_summary_card.dart';
import '../../../../../../../core/widget/list/app_listile.dart';
import '../../../../../../../core/widget/navigation/app_appbar.dart';
import '../../../../../../routes/app_pages.dart';
import '../controllers/index_controller.dart';

class IndexBerandaView extends GetView<IndexBerandaController> {
  const IndexBerandaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBarPengguna(
        showBackButton: false,
        title: "Beranda",
        subtitle: "Pusat pengelolaan keamanan dokumen Anda",
        actionIcon1: Symbols.more_vert_rounded,
        onAction1: () {},
        onBackPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: AppFeatureCard(
                    layout: AppTataLetakKartuFitur.horizontal,
                    label: 'Keamanan',
                    title: 'Kunci Berkas',
                    description:
                        'Ubah dokumen menjadi data terenkripsi agar hanya dapat diakses oleh pihak yang memiliki kunci.',
                    backgroundIcon: Symbols.lock,
                    actionText: 'Mulai Enkripsi',
                    onTap: () {
                      Get.toNamed(Routes.indexKunciBerkas);
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AppFeatureCard(
                    layout: AppTataLetakKartuFitur.horizontal,
                    label: 'Akses Data',
                    title: 'Buka Berkas',
                    description:
                        'Pulihkan dokumen terenkripsi kembali ke bentuk aslinya menggunakan kunci yang valid.',
                    backgroundIcon: Symbols.lock_open,
                    actionText: 'Mulai Dekripsi',
                    onTap: () {
                      Get.toNamed(Routes.indexBukaKunciBerkas);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            AppSectionHeader(
              title: "Ringkasan Aktivitas",
              onAction: () {
                //
              },
            ),
            const SizedBox(height: 8),
            const AppSummaryCard(
              items: [
                AppItemRingkasan(
                  icon: Symbols.lock,
                  count: "24",
                  title: "Enkripsi",
                  subtitle: "Total",
                ),
                AppItemRingkasan(
                  icon: Symbols.folder,
                  count: "18",
                  title: "Dokumen",
                  subtitle: "Tersimpan",
                ),
                AppItemRingkasan(
                  icon: Symbols.lock_open,
                  count: "6",
                  title: "Dekripsi",
                  subtitle: "Berhasil",
                ),
              ],
            ),
            const SizedBox(height: 24),
            AppSectionHeader(
              title: "Aktivitas Terbaru",
              onAction: () {
                //
              },
            ),
            const SizedBox(height: 8),
            const AppActivityTile(
              icon: Symbols.lock,
              title: "Enkripsi Dokumen",
              subtitle: "laporan_keuangan.pdf",
              date: "28 Jun 2026",
              status: ActivityStatus.success,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
