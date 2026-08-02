import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../../../../../../../core/widget/card/app_feature_card.dart';
import 'privacy_section.dart';

class LocalStorageSection extends StatelessWidget {
  const LocalStorageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PrivacySection(
      icon: Symbols.storage_rounded,
      title: "Local Storage",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const AppFeatureCard(
            label: "Storage",
            title: "Your Data Stays on Your Device",
            description:
                "DocLock is designed to work locally. Your protected files remain on your own device and are never uploaded to our servers.",
            backgroundIcon: Symbols.smartphone_rounded,
            actionText: "Local Only",
          ),

          const SizedBox(height: 20),

          const Text(
            "DocLock may store the following information locally:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 14),

          const _StorageItem(
            Symbols.lock_rounded,
            "Protected file records",
          ),

          const _StorageItem(
            Symbols.settings_rounded,
            "Application settings",
          ),

          const _StorageItem(
            Symbols.lock_rounded,
            "Security preferences",
          ),

          const _StorageItem(
            Symbols.tune_rounded,
            "User configuration",
          ),

          const SizedBox(height: 18),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(.08),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Icon(
                  Symbols.info_rounded,
                  color: Colors.blue,
                ),

                SizedBox(width: 12),

                Expanded(
                  child: Text(
                    "All application data is stored locally on your device. "
                    "DocLock does not synchronize files with cloud services.",
                    style: TextStyle(height: 1.5),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StorageItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _StorageItem(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 12),
          Expanded(child: Text(title)),
        ],
      ),
    );
  }
}