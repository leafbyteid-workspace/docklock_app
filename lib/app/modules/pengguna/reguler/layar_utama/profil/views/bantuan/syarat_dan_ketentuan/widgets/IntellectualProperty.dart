import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../kebijakan_privasi/widgets/privacy_section.dart';

class IntellectualPropertySection extends StatelessWidget {
  const IntellectualPropertySection({super.key});

  @override
  Widget build(BuildContext context) {
    return PrivacySection(
      icon: Symbols.copyright_rounded,
      title: "Intellectual Property",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "DocLock, including its design, logo, user interface, source code, graphics, and documentation, is protected by applicable intellectual property laws.",
            style: TextStyle(height: 1.6),
          ),
          const SizedBox(height: 18),
          const Text(
            "Unless otherwise permitted by law, you may not:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          const _Item("Copy or redistribute the application."),
          const _Item("Reverse engineer or modify the application."),
          const _Item("Use DocLock trademarks without permission."),
          const _Item("Sell or sublicense the application."),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String text;

  const _Item(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Symbols.gpp_good_rounded,
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
