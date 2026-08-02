import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../kebijakan_privasi/widgets/privacy_section.dart';

class UserResponsibilitySection extends StatelessWidget {
  const UserResponsibilitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return PrivacySection(
      icon: Symbols.person_rounded,
      title: "User Responsibilities",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "As a user of DocLock, you are responsible for maintaining the security of your own device and protected files.",
            style: TextStyle(height: 1.6),
          ),
          const SizedBox(height: 20),
          const _Responsibility(
            Symbols.password_rounded,
            "Keep your authentication credentials confidential.",
          ),
          const _Responsibility(
            Symbols.backup_rounded,
            "Maintain backups of important files.",
          ),
          const _Responsibility(
            Symbols.security_rounded,
            "Protect your device from unauthorized access.",
          ),
          const _Responsibility(
            Symbols.system_security_update_good_rounded,
            "Keep your operating system updated.",
          ),
          const _Responsibility(
            Symbols.rule_rounded,
            "Use the application responsibly and lawfully.",
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Symbols.lightbulb_rounded,
                  color: Colors.orange,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "For maximum protection, always keep backup copies of important files before applying security changes.",
                    style: TextStyle(height: 1.5),
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

class _Responsibility extends StatelessWidget {
  final IconData icon;
  final String text;

  const _Responsibility(
    this.icon,
    this.text,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          const SizedBox(width: 12),
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
