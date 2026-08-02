import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'privacy_section.dart';

class ChangesSection extends StatelessWidget {
  const ChangesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const PrivacySection(
      icon: Symbols.update_rounded,
      title: "Changes to this Privacy Policy",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "We may update this Privacy Policy from time to time to reflect application improvements, legal requirements, or operational changes.",
            style: TextStyle(
              height: 1.6,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Whenever significant changes are made:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          _ChangeItem(
            "The \"Last Updated\" date will be revised.",
          ),
          _ChangeItem(
            "The latest version will be available within the application.",
          ),
          _ChangeItem(
            "Users are encouraged to review this policy periodically.",
          ),
        ],
      ),
    );
  }
}

class _ChangeItem extends StatelessWidget {
  final String text;

  const _ChangeItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
