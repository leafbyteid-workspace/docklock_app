import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'privacy_section.dart';

class ChildrenSection extends StatelessWidget {
  const ChildrenSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PrivacySection(
      icon: Symbols.child_care_rounded,
      title: "Children's Privacy",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "DocLock is intended for general audiences and is not specifically directed toward children under the age of 13.",
            style: TextStyle(
              height: 1.6,
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            "We do not knowingly collect personal information from children.",
            style: TextStyle(
              height: 1.6,
            ),
          ),
          const SizedBox(height: 18),
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
                  Symbols.family_restroom_rounded,
                  color: Colors.orange,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "If you believe a child has provided personal information to us, "
                    "please contact us so that we can take appropriate action.",
                    style: TextStyle(
                      height: 1.5,
                    ),
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
