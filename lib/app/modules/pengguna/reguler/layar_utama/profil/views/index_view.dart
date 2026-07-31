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
import '../controllers/index_controller.dart';

class IndexProfilPenggunaView extends GetView<IndexProfilPenggunaController> {
  const IndexProfilPenggunaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPengguna(
        showBackButton: false,
        title: "Profil Saya",
        subtitle: "Kelola informasi akun dan pengaturan aplikasi",
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
                return LoadingAnimationWidget.inkDrop(
                  color: AppColor.primary,
                  size: 32,
                );
              }

              final pengguna = controller.pengguna.value;

              if (pengguna == null) {
                return const SizedBox.shrink();
              }

              return AppProfileCard(
                title: pengguna.namaLengkap,
                subtitle: controller.email.value,
                status: "Aktif",
                caption: "Pengguna",
                statusColor: const Color(0xFF16A34A),
                onTap: () {},
              );
            }),
            const SizedBox(height: 24),
            AppProfileMenuSection(
              title: "Akun",
              children: [
                AppProfileMenuTile(
                  icon: Symbols.person_rounded,
                  title: "Informasi Pribadi",
                  subtitle: "Kelola data profil pengguna",
                  onTap: () {},
                ),
                AppProfileMenuTile(
                  icon: Symbols.lock_rounded,
                  title: "Keamanan Akun",
                  subtitle: "Kelola Kata sandi dan Keamanan Akun",
                  showDivider: false,
                  onTap: () {},
                ),
              ],
            ),
            AppProfileMenuSection(
              title: "Preferensi",
              children: [
                AppProfileMenuTile(
                  icon: Symbols.dark_mode_rounded,
                  title: "Tema",
                  subtitle: "Atur tampilan terang, gelap, atau sistem",
                  onTap: () {},
                ),
                AppProfileMenuTile(
                  icon: Symbols.language_rounded,
                  title: "Bahasa",
                  subtitle: "Pilih bahasa yang digunakan aplikasi",
                  showDivider: false,
                  onTap: () {},
                ),
              ],
            ),
            AppProfileMenuSection(
              title: "Bantuan",
              children: [
                AppProfileMenuTile(
                  icon: Symbols.privacy_tip_rounded,
                  title: "Kebijakan Privasi",
                  subtitle: "Pelajari cara kami mengelola data Anda",
                  onTap: () {},
                ),
                AppProfileMenuTile(
                  icon: Symbols.gavel_rounded,
                  title: "Syarat dan Ketentuan",
                  subtitle: "Ketentuan penggunaan aplikasi",
                  onTap: () {},
                ),
                AppProfileMenuTile(
                  icon: Symbols.star_rate_rounded,
                  title: "Beri Penilaian",
                  subtitle: "Bagikan pengalaman Anda menggunakan aplikasi",
                  onTap: () {},
                ),
                AppProfileMenuTile(
                  icon: Symbols.feedback_rounded,
                  title: "Kirim Saran",
                  subtitle: "Sampaikan masukan untuk pengembangan aplikasi",
                  onTap: () {},
                ),
                AppProfileMenuTile(
                  icon: Symbols.info_rounded,
                  title: "Tentang Aplikasi",
                  subtitle: "Informasi versi dan pengembang aplikasi",
                  showDivider: false,
                  onTap: () {},
                ),
              ],
            ),
            AppProfileMenuSection(
              title: "Sesi",
              children: [
                AppProfileMenuTile(
                  icon: Symbols.logout_rounded,
                  iconColor: Colors.red,
                  textColor: Colors.red,
                  title: "Keluar",
                  subtitle: "Keluar dari aplikasi",
                  showDivider: false,
                  onTap: () {},
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
