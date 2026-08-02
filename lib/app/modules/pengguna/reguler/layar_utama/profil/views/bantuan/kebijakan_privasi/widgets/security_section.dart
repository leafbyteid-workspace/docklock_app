import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../../../../../../../core/widget/card/app_feature_card.dart';
import 'privacy_section.dart';

class SecuritySection extends StatelessWidget {
  const SecuritySection({super.key});

  @override
  Widget build(BuildContext context) {
    return PrivacySection(
      icon: Symbols.shield_lock_rounded,
      title: "Data Security",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const AppFeatureCard(
            label: "Security",
            title: "Protecting Your Information",
            description:
                "DocLock applies reasonable security measures to help protect your locally stored application data.",
            backgroundIcon: Symbols.shield_rounded,
            actionText: "Protected",
          ),

          const SizedBox(height: 20),

          const Text(
            "Security Practices",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 12),

          const _SecurityItem(
            "Application settings are stored locally.",
          ),

          const _SecurityItem(
            "Protected files remain on your own device.",
          ),

          const _SecurityItem(
            "No file contents are transmitted to our servers.",
          ),

          const _SecurityItem(
            "We do not monitor or inspect your personal files.",
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(.08),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Icon(
                  Symbols.warning_rounded,
                  color: Colors.orange,
                ),

                SizedBox(width: 12),

                Expanded(
                  child: Text(
                    "Although we take reasonable measures to help protect your information, "
                    "no software can guarantee absolute security. "
                    "Users are encouraged to maintain secure device settings and regular backups.",
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

class _SecurityItem extends StatelessWidget {
  final String text;

  const _SecurityItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Icon(
            Symbols.verified_rounded,
            color: Colors.green,
            size: 20,
          ),

          const SizedBox(width: 10),

          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}