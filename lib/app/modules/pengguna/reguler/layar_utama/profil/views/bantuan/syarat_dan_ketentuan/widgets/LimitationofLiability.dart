import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../../../../../../../core/widget/card/app_feature_card.dart';
import '../../kebijakan_privasi/widgets/privacy_section.dart';

class LiabilitySection extends StatelessWidget {
  const LiabilitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return PrivacySection(
      icon: Symbols.balance_rounded,
      title: "Limitation of Liability",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppFeatureCard(
            label: "Liability",
            title: "Provided As Is",
            description:
                "DocLock is provided on an 'as is' and 'as available' basis without warranties of any kind.",
            backgroundIcon: Symbols.gavel_rounded,
            actionText: "Legal Notice",
          ),
          const SizedBox(height: 20),
          const Text(
            "To the fullest extent permitted by law, the developer shall not be liable for:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          const _Liability("Loss of files or documents."),
          const _Liability("Hardware or software failures."),
          const _Liability("Improper use of the application."),
          const _Liability(
              "Unauthorized access resulting from weak device security."),
          const _Liability("Indirect or consequential damages."),
          const SizedBox(height: 20),
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
                    "Users are solely responsible for maintaining backups of important files before using DocLock.",
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

class _Liability extends StatelessWidget {
  final String text;

  const _Liability(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Symbols.cancel_rounded,
            color: Colors.red,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
