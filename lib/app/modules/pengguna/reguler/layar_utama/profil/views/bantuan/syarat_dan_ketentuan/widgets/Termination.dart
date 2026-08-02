import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../kebijakan_privasi/widgets/privacy_section.dart';

class TerminationSection extends StatelessWidget {
  const TerminationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const PrivacySection(
      icon: Symbols.block_rounded,
      title: "Termination",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "We reserve the right to modify, suspend, or discontinue DocLock at any time without prior notice.",
            style: TextStyle(height: 1.6),
          ),
          SizedBox(height: 18),
          Text(
            "Any provision of these Terms that should reasonably survive termination shall remain in effect.",
            style: TextStyle(height: 1.6),
          ),
        ],
      ),
    );
  }
}
