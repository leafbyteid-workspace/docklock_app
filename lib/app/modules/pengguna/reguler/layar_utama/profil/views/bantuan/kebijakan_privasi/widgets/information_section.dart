import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../../../../../../../core/widget/card/app_feature_card.dart';
import 'privacy_section.dart';

class InformationSection extends StatelessWidget {
  const InformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const PrivacySection(
      icon: Symbols.dataset_rounded,
      title: "Information We Collect",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppFeatureCard(
            label: "Privacy",
            title: "Minimal Data Collection",
            description:
                "DocLock is designed to operate without requiring personal account registration or unnecessary personal information.",
            backgroundIcon: Symbols.privacy_tip_rounded,
            actionText: "Protected",
          ),
          SizedBox(height: 20),
          Text(
            "DocLock does NOT collect:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 12),
          _CheckItem("Phone number"),
          _CheckItem("Contacts"),
          _CheckItem("Messages"),
          _CheckItem("Location"),
          _CheckItem("Photos metadata"),
          _CheckItem("Videos metadata"),
          _CheckItem("Biometric information"),
          SizedBox(height: 20),
          Text(
            "Application Data",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "The application may store local configuration such as application preferences and lock settings directly on your device. "
            "These settings are never uploaded to external servers.",
            style: TextStyle(height: 1.6),
          ),
        ],
      ),
    );
  }
}

class _CheckItem extends StatelessWidget {
  final String text;

  const _CheckItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const Icon(
            Symbols.check_circle_rounded,
            color: Colors.green,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
