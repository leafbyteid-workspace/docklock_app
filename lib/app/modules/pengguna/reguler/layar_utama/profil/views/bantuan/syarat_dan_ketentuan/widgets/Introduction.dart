import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../kebijakan_privasi/widgets/privacy_section.dart';

class IntroductionSection extends StatelessWidget {
  const IntroductionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PrivacySection(
      icon: Symbols.info_rounded,
      title: "Introduction",
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "These Terms and Conditions govern your access to and use of the DocLock application.",
            style: TextStyle(
              height: 1.6,
            ),
          ),
          SizedBox(height: 18),
          Text(
            "By downloading, installing, or using DocLock, you acknowledge that you have read, understood, and agreed to these Terms and Conditions.",
            style: TextStyle(
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
