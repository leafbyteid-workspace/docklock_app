import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../../../../../core/widget/card/app_feature_card.dart';
import '../../../../../../../../../core/widget/navigation/app_appbar.dart';
import '../../../controllers/bantuan/tentang_aplikasi/index_controller.dart';

class IndexTentangAplikasiView extends GetView<IndexTentangAplikasiController> {
  const IndexTentangAplikasiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPengguna(
        title: "Tentang Aplikasi",
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [
                  Color(0xff2563EB),
                  Color(0xff1E40AF),
                ],
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 42,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'material/assets/logo/doclock-primary-logo.png',
                    width: 104,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "DocLock",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Secure File Locker",
                  style: TextStyle(
                    color: Colors.white.withOpacity(.85),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "Lindungi dokumen dan folder penting Anda dengan sistem penguncian yang cepat, sederhana, dan aman.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(.92),
                    height: 1.5,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Tentang DocLock",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "DocLock merupakan aplikasi keamanan lokal yang dirancang untuk membantu pengguna menjaga privasi Berkas dan folder penting. Dengan antarmuka yang sederhana namun modern, pengguna dapat mengunci dokumen secara cepat sehingga tidak dapat diakses oleh pihak lain tanpa izin.",
            style: TextStyle(
              height: 1.6,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Tujuan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "DocLock hadir sebagai solusi ringan untuk memberikan perlindungan tambahan terhadap data pribadi maupun pekerjaan. Aplikasi ini memudahkan siapa saja dalam menjaga kerahasiaan dokumen penting tanpa memerlukan konfigurasi keamanan yang rumit.",
            style: TextStyle(
              height: 1.6,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Fitur Utama",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 16),
          const AppFeatureCard(
            label: "Security",
            title: "Kunci Berkas",
            description:
                "Lindungi berbagai jenis Berkas maupun folder agar tidak dapat diakses tanpa izin.",
            backgroundIcon: Symbols.lock_rounded,
            actionText: "Pelajari",
          ),
          const SizedBox(height: 16),
          const AppFeatureCard(
            label: "Authentication",
            title: "Autentikasi Aman",
            description:
                "Pembukaan Berkas hanya dapat dilakukan setelah proses autentikasi berhasil.",
            backgroundIcon: Symbols.verified_user_rounded,
            actionText: "Pelajari",
          ),
          const SizedBox(height: 16),
          const AppFeatureCard(
            label: "Performance",
            title: "Cepat & Ringan",
            description:
                "Dirancang dengan proses penguncian yang efisien tanpa mengurangi performa perangkat.",
            backgroundIcon: Symbols.bolt_rounded,
            actionText: "Pelajari",
          ),
          const SizedBox(height: 16),
          const AppFeatureCard(
            label: "Simple",
            title: "Antarmuka Modern",
            description:
                "Desain sederhana sehingga mudah digunakan oleh semua kalangan pengguna.",
            backgroundIcon: Symbols.dashboard_customize_rounded,
            actionText: "Pelajari",
          ),
          const SizedBox(height: 32),
          const Text(
            "Kegunaan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 16),
          _item(
            Symbols.description_rounded,
            "Melindungi dokumen pribadi.",
          ),
          _item(
            Symbols.work_rounded,
            "Mengamankan Berkas pekerjaan maupun proyek.",
          ),
          _item(
            Symbols.folder_rounded,
            "Mencegah akses tidak sah pada folder tertentu.",
          ),
          _item(
            Symbols.security_rounded,
            "Menjaga kerahasiaan data sensitif.",
          ),
          const SizedBox(height: 32),
          const Text(
            "Keamanan & Privasi",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Symbols.shield_lock_rounded,
                  size: 34,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    "DocLock merupakan aplikasi keamanan lokal. Untuk perlindungan yang lebih tinggi, pengguna disarankan mengombinasikan aplikasi ini dengan metode enkripsi serta praktik keamanan sistem yang baik.",
                    style: TextStyle(
                      height: 1.6,
                      color: Colors.grey.shade700,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            "Informasi Aplikasi",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 16),
          const Card(
            elevation: 0,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Symbols.new_releases_rounded),
                  title: Text("Versi"),
                  trailing: Text("1.0.0"),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Symbols.code_rounded),
                  title: Text("Developer"),
                  trailing: Text("DocLock Team"),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Symbols.android_rounded),
                  title: Text("Platform"),
                  trailing: Text("Android"),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Symbols.copyright_rounded),
                  title: Text("Hak Cipta"),
                  trailing: Text("© 2026"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: Text(
              "Terima kasih telah menggunakan DocLock.\nKami berkomitmen membantu menjaga keamanan data Anda.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade600,
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  static Widget _item(
    IconData icon,
    String text,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                height: 1.5,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
