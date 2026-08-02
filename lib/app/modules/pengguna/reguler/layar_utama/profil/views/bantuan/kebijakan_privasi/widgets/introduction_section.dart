import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'privacy_section.dart';

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
            "Welcome to DocLock.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 12),
          Text(
            "DocLock is a local file protection application designed to help you secure important files and folders on your device. "
            "We value your privacy and are committed to protecting your personal information.",
            style: TextStyle(
              height: 1.6,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "This Privacy Policy explains:",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          _Bullet("What information we collect"),
          _Bullet("How we use your information"),
          _Bullet("How your files are protected"),
          _Bullet("Your rights regarding your data"),
        ],
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  final String text;

  const _Bullet(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• "),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}