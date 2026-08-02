import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../../../../../../../core/widget/card/app_feature_card.dart';
import 'privacy_section.dart';

class PermissionSection extends StatelessWidget {
  const PermissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PrivacySection(
      icon: Symbols.lock_open_rounded,
      title: "Permissions",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const AppFeatureCard(
            label: "Permission",
            title: "Storage Access",
            description:
                "Storage permission is required only to allow you to choose, lock, unlock, and manage files stored on your device.",
            backgroundIcon: Symbols.folder_managed_rounded,
            actionText: "Required",
          ),

          const SizedBox(height: 20),

          const Text(
            "Why do we need storage permission?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 14),

          const _PermissionItem(
            icon: Symbols.folder_rounded,
            title: "Select Files",
            description:
                "Allows you to browse and choose files or folders you want to protect.",
          ),

          const _PermissionItem(
            icon: Symbols.lock_rounded,
            title: "Lock Files",
            description:
                "Used to apply protection to selected files and folders.",
          ),

          const _PermissionItem(
            icon: Symbols.lock_open_right_rounded,
            title: "Unlock Files",
            description:
                "Required when restoring access to protected files.",
          ),

          const _PermissionItem(
            icon: Symbols.settings_rounded,
            title: "Manage Protected Items",
            description:
                "Allows DocLock to maintain your protected file list locally.",
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Icon(
                  Symbols.verified_user_rounded,
                  color: Colors.green,
                ),

                SizedBox(width: 12),

                Expanded(
                  child: Text(
                    "Your files remain on your device. DocLock never uploads your documents, photos, or folders to external servers.",
                    style: TextStyle(
                      height: 1.5,
                    ),
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

class _PermissionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _PermissionItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Icon(icon),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  description,
                  style: const TextStyle(
                    height: 1.5,
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