import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../kebijakan_privasi/widgets/privacy_section.dart';

class ChangesSection extends StatelessWidget {
  const ChangesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PrivacySection(
      icon: Symbols.update_rounded,
      title: "Changes to Terms",
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "These Terms and Conditions may be updated from time to time to reflect improvements, legal requirements, or operational changes.",
            style: TextStyle(height: 1.6),
          ),
          SizedBox(height: 18),
          Text(
            "Continued use of DocLock after changes become effective constitutes your acceptance of the updated Terms.",
            style: TextStyle(height: 1.6),
          ),
        ],
      ),
    );
  }
}
