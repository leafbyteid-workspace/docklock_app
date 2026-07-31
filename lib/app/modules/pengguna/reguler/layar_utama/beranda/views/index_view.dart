import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../../../core/constants/app_color.dart';
import '../../../../../../../core/errors/app_empty_state.dart';
import '../../../../../../../core/helper/date_helper/format_date.dart';
import '../../../../../../../core/layout/app_section_header.dart';
import '../../../../../../../core/widget/card/app_feature_card.dart';
import '../../../../../../../core/widget/card/app_summary_card.dart';
import '../../../../../../../core/widget/list/app_listile.dart';
import '../../../../../../../core/widget/navigation/app_appbar.dart';
import '../../../../../../data/local/isar/models/riwayat_aktivitas_model.dart';
import '../../../../../../routes/app_pages.dart';
import '../controllers/index_controller.dart';

class IndexBerandaView extends GetView<IndexBerandaController> {
  const IndexBerandaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: const AppBarPengguna(
        showBackButton: false,
        title: "Beranda",
        subtitle: "Pusat pengelolaan keamanan dokumen Anda",
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.refreshData();
        },
        child: SingleChildScrollView(
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
                      actionText: 'Mulai Kunci',
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
                      actionText: 'Mulai Buka',
                      onTap: () {
                        Get.toNamed(Routes.indexBukaKunciBerkas);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const AppSectionHeader(
                title: "Ringkasan Aktivitas",
              ),
              const SizedBox(height: 8),
              Obx(
                () => AppSummaryCard(
                  items: [
                    AppItemRingkasan(
                      icon: Symbols.lock,
                      count: controller.totalEnkripsi.value.toString(),
                      title: "Terkunci",
                      subtitle: "Total",
                    ),
                    AppItemRingkasan(
                      icon: Symbols.folder,
                      count: controller.totalDokumen.value.toString(),
                      title: "Dokumen",
                      subtitle: "Tersimpan",
                    ),
                    AppItemRingkasan(
                      icon: Symbols.lock_open,
                      count: controller.totalDekripsi.value.toString(),
                      title: "Terbuka",
                      subtitle: "Berhasil",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const AppSectionHeader(
                title: "Aktivitas Terbaru",
              ),
              const SizedBox(height: 8),
              Obx(() {
                if (controller.loadingAktivitas.value) {
                  return LoadingAnimationWidget.inkDrop(
                    color: AppColor.primary,
                    size: 32,
                  );
                }

                if (controller.aktivitasTerbaru.isEmpty) {
                  return const EmptyState(
                    icon: Symbols.history,
                    title: 'Belum Ada Aktivitas',
                    subtitle:
                        'Aktivitas terbaru akan ditampilkan di sini setelah Anda menambahkan data.',
                  );
                }

                return Column(
                  children: controller.aktivitasTerbaru.map((aktivitas) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
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
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
