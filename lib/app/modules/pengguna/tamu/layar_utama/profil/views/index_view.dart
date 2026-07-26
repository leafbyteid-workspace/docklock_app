import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      appBar: AppBarPengguna(
        showBackButton: false,
        title: "Profil",
        subtitle: "Kelola informasi akun dan pengaturan aplikasi",
        actionIcon1: Symbols.more_vert_rounded,
        onAction1: () {},
        onBackPressed: () {
          Get.back();
        },
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          /// Profile Header
          AppProfileCard(
            title: "Muhammad Rizki Pratama",
            subtitle: "rizki.pratama@email.com",
            status: "Aktif",
            caption: "Pengguna",
            statusColor: const Color(0xFF16A34A),
            onTap: () {},
          ),

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
                icon: Symbols.badge_rounded,
                title: "Data Kepegawaian",
                subtitle: "Lihat informasi pegawai",
                onTap: () {},
              ),
              AppProfileMenuTile(
                icon: Symbols.lock_rounded,
                title: "Keamanan Akun",
                subtitle: "Password dan keamanan",
                showDivider: false,
                onTap: () {},
              ),
            ],
          ),

          AppProfileMenuSection(
            title: "Preferensi",
            children: [
              AppProfileMenuTile(
                icon: Symbols.notifications_rounded,
                title: "Notifikasi",
                subtitle: "Kelola pemberitahuan aplikasi",
                onTap: () {},
              ),
              AppProfileMenuTile(
                icon: Symbols.dark_mode_rounded,
                title: "Tema",
                subtitle: "Terang, Gelap, atau Sistem",
                onTap: () {},
              ),
              AppProfileMenuTile(
                icon: Symbols.language_rounded,
                title: "Bahasa",
                subtitle: "Bahasa Indonesia",
                showDivider: false,
                onTap: () {},
              ),
            ],
          ),

          AppProfileMenuSection(
            title: "Bantuan",
            children: [
              AppProfileMenuTile(
                icon: Symbols.help_rounded,
                title: "Pusat Bantuan",
                subtitle: "FAQ dan dokumentasi",
                onTap: () {},
              ),
              AppProfileMenuTile(
                icon: Symbols.info_rounded,
                title: "Tentang Aplikasi",
                subtitle: "Versi 1.0.0",
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
                subtitle: "Logout dari aplikasi",
                showDivider: false,
                onTap: () {},
              ),
            ],
          ),

          const SizedBox(height: 10),

          Center(
            child: Text(
              "SIMPEG Mobile\nVersi 1.0.0",
              textAlign: TextAlign.center,
              style: AppTypography.footnote().copyWith(
                color: AppColor.textSecondary,
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
