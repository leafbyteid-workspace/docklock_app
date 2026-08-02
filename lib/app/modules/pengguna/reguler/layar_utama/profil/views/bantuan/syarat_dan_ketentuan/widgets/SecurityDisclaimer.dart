import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../../../../../../../core/widget/card/app_feature_card.dart';
import '../../kebijakan_privasi/widgets/privacy_section.dart';

class SecurityDisclaimerSection extends StatelessWidget {
  const SecurityDisclaimerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PrivacySection(
      icon: Symbols.shield_lock_rounded,
      title: "Security Disclaimer",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppFeatureCard(
            label: "Disclaimer",
            title: "Reasonable Protection",
            description:
                "DocLock is designed to improve file security, but no software can guarantee complete protection against every security threat.",
            backgroundIcon: Symbols.shield_rounded,
            actionText: "Important",
          ),
          const SizedBox(height: 20),
          const Text(
            "While we implement reasonable safeguards, users should understand that:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          const _Disclaimer(
            "No software can provide absolute security.",
          ),
          const _Disclaimer(
            "Device security remains the user's responsibility.",
          ),
          const _Disclaimer(
            "Hardware failures may still result in data loss.",
          ),
          const _Disclaimer(
            "Users should maintain regular backups.",
          ),
          const _Disclaimer(
            "Strong authentication methods are recommended.",
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(.08),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Symbols.warning_rounded,
                  color: Colors.red,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "DocLock is intended to enhance local file protection and should not be considered a replacement for comprehensive data security practices.",
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

class _Disclaimer extends StatelessWidget {
  final String text;

  const _Disclaimer(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Symbols.info_rounded,
            size: 20,
            color: Colors.blue,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
