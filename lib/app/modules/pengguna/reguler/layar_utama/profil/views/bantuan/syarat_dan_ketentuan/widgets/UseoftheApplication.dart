import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../../../../../../../core/widget/card/app_feature_card.dart';
import '../../kebijakan_privasi/widgets/privacy_section.dart';

class UseApplicationSection extends StatelessWidget {
  const UseApplicationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const PrivacySection(
      icon: Symbols.apps_rounded,
      title: "Use of the Application",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          AppFeatureCard(
            label: "Usage",
            title: "Intended Purpose",
            description:
                "DocLock is intended to help users protect files and folders stored on their own device through local security features.",
            backgroundIcon: Symbols.lock_rounded,
            actionText: "Application Use",
          ),

          SizedBox(height: 22),

          Text(
            "You agree to use DocLock only for lawful purposes and in accordance with these Terms.",
            style: TextStyle(height: 1.6),
          ),

          SizedBox(height: 20),

          Text(
            "Permitted Uses",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          SizedBox(height: 12),

          _Item(
            Symbols.check_circle_rounded,
            "Protect personal files and documents.",
          ),

          _Item(
            Symbols.check_circle_rounded,
            "Secure work-related files stored on your device.",
          ),

          _Item(
            Symbols.check_circle_rounded,
            "Manage protected folders locally.",
          ),

          _Item(
            Symbols.check_circle_rounded,
            "Use the application in compliance with applicable laws.",
          ),

          SizedBox(height: 20),

          Text(
            "Prohibited Uses",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          SizedBox(height: 12),

          _Item(
            Symbols.cancel_rounded,
            "Attempting to modify or bypass application security.",
          ),

          _Item(
            Symbols.cancel_rounded,
            "Using the application for unlawful activities.",
          ),

          _Item(
            Symbols.cancel_rounded,
            "Distributing modified versions of DocLock without authorization.",
          ),

        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {

  final IconData icon;
  final String text;

  const _Item(
    this.icon,
    this.text,
  );

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Icon(
            icon,
            color: icon == Symbols.check_circle_rounded
                ? Colors.green
                : Colors.red,
            size: 20,
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