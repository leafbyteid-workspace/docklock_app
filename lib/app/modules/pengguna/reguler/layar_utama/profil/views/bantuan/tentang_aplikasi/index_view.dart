import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../../../../../core/widget/card/app_feature_card.dart';
import '../../../../../../../../../core/widget/navigation/app_appbar.dart';
import '../../../../../../../../../localization/locale_keys.dart';
import '../../../controllers/bantuan/tentang_aplikasi/index_controller.dart';

class IndexTentangAplikasiView extends GetView<IndexTentangAplikasiController> {
  const IndexTentangAplikasiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPengguna(
        title: LocaleKeys.aboutApp.tr,
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
                  "Protect your important files and folders with a fast, simple, and secure locking system.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(.92),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "About DocLock",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "DocLock is a local security application designed to help users protect the privacy of important files and folders. With a simple yet modern interface, users can quickly lock documents to prevent unauthorized access.",
            style: TextStyle(
              height: 1.6,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Purpose",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "DocLock provides a lightweight solution for adding an extra layer of protection to personal and work-related data. It enables users to keep important documents secure without requiring complicated security configurations.",
            style: TextStyle(
              height: 1.6,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Main Features",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 16),
          const AppFeatureCard(
            label: "Security",
            title: "File Locking",
            description:
                "Protect various types of files and folders from unauthorized access.",
            backgroundIcon: Symbols.lock_rounded,
            actionText: "Learn More",
          ),
          const SizedBox(height: 16),
          const AppFeatureCard(
            label: "Authentication",
            title: "Secure Authentication",
            description:
                "Files can only be unlocked after successful authentication.",
            backgroundIcon: Symbols.verified_user_rounded,
            actionText: "Learn More",
          ),
          const SizedBox(height: 16),
          const AppFeatureCard(
            label: "Performance",
            title: "Fast & Lightweight",
            description:
                "Designed with an efficient locking process without compromising device performance.",
            backgroundIcon: Symbols.bolt_rounded,
            actionText: "Learn More",
          ),
          const SizedBox(height: 16),
          const AppFeatureCard(
            label: "Simple",
            title: "Modern Interface",
            description:
                "A clean and intuitive design that is easy for everyone to use.",
            backgroundIcon: Symbols.dashboard_customize_rounded,
            actionText: "Learn More",
          ),
          const SizedBox(height: 32),
          const Text(
            "Use Cases",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 16),
          _item(
            Symbols.description_rounded,
            "Protect personal documents.",
          ),
          _item(
            Symbols.work_rounded,
            "Secure work files and project documents.",
          ),
          _item(
            Symbols.folder_rounded,
            "Prevent unauthorized access to specific folders.",
          ),
          _item(
            Symbols.security_rounded,
            "Keep sensitive data confidential.",
          ),
          const SizedBox(height: 32),
          const Text(
            "Security & Privacy",
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
                    "DocLock is a local security application. For stronger protection, users are encouraged to combine this application with encryption methods and good system security practices.",
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
            "Application Information",
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
                  title: Text("Version"),
                  trailing: Text("1.0.0"),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Symbols.code_rounded),
                  title: Text("Developer"),
                  trailing: Text("Leafbyte Team"),
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
                  title: Text("Copyright"),
                  trailing: Text("Leafbyte© 2026"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: Text(
              "Thank you for using DocLock.\nWe are committed to helping keep your data secure.",
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
