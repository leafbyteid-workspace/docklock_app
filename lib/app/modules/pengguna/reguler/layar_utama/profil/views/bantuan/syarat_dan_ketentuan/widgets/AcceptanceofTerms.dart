import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../../../../../../../core/widget/card/app_feature_card.dart';
import '../../kebijakan_privasi/widgets/privacy_section.dart';

class AcceptanceSection extends StatelessWidget {
  const AcceptanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const PrivacySection(
      icon: Symbols.fact_check_rounded,
      title: "Acceptance of Terms",
      child: Column(
        children: [

          AppFeatureCard(
            label: "Agreement",
            title: "Acceptance of Terms",
            description:
                "By accessing or using DocLock, you agree to comply with these Terms and Conditions.",
            backgroundIcon: Symbols.handshake_rounded,
            actionText: "Accepted",
          ),

          SizedBox(height: 20),

          Text(
            "If you do not agree with any part of these Terms, please discontinue the use of the application.",
            style: TextStyle(
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}