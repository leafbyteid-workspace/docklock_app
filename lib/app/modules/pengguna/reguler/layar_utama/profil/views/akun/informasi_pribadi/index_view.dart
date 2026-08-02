import 'package:doclock_app/core/errors/app_empty_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../../../../../core/constants/app_color.dart';
import '../../../../../../../../../core/layout/pengguna/profil/app_profilecard.dart';
import '../../../../../../../../../core/layout/pengguna/profil/app_profilemenusection.dart';
import '../../../../../../../../../core/layout/pengguna/profil/app_proflemenu.dart';
import '../../../../../../../../../core/widget/navigation/app_appbar.dart';
import '../../../../../../../../../localization/locale_keys.dart';
import '../../../controllers/akun/informasi_pribadi/index_controller.dart';

class IndexAkunInformasiPribadiView
    extends GetView<IndexAkunInformasiPribadiController> {
  const IndexAkunInformasiPribadiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPengguna(
        title: LocaleKeys.personalInformation.tr,
        onBackPressed: () {
          Get.back();
        },
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: LoadingAnimationWidget.inkDrop(
              color: AppColor.primary,
              size: 36,
            ),
          );
        }

        final pengguna = controller.pengguna.value;
        final akun = controller.akun.value;

        if (pengguna == null) {
          return const Center(
            child: EmptyState(
                icon: Symbols.empty_dashboard_rounded,
                title: "Data Pengguna Tidak Ditemukan",
                subtitle: "Silahkan Lakukan Proses Masuk Terlebih Dahulu!"),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.refreshData,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              AppProfileCard(
                title: pengguna.namaLengkap,
                subtitle: akun?.email ?? "-",
                status: LocaleKeys.active.tr,
                caption: "@${pengguna.namaPengguna}",
                statusColor: const Color(0xFF16A34A),
                onTap: () {
                  // Opsional
                },
              ),
              const SizedBox(height: 16),
              AppProfileMenuSection(
                title: LocaleKeys.userDataDetails.tr,
                children: [
                  AppDetailProfilMenu(
                    icon: Symbols.person_rounded,
                    title: LocaleKeys.fullName.tr,
                    value: pengguna.namaLengkap,
                    onTap: controller.editNamaLengkap,
                  ),
                  AppDetailProfilMenu(
                    icon: Symbols.person_rounded,
                    title: LocaleKeys.userName.tr,
                    value: pengguna.namaPengguna,
                    onTap: controller.editNamaPengguna,
                  ),
                  AppDetailProfilMenu(
                    icon: Symbols.email_rounded,
                    title: LocaleKeys.email.tr,
                    value: akun?.email ?? "-",
                    onTap: controller.editEmail,
                  ),
                  AppDetailProfilMenu(
                    icon: Symbols.cake_rounded,
                    title: LocaleKeys.age.tr,
                    value: pengguna.usia?.toString() ?? "-",
                    onTap: controller.editUsia,
                  ),
                  AppDetailProfilMenu(
                    icon: Symbols.male_rounded,
                    title: LocaleKeys.gender.tr,
                    value: pengguna.jenisKelamin.name,
                    onTap: controller.editJenisKelamin,
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      }),
    );
  }
}
