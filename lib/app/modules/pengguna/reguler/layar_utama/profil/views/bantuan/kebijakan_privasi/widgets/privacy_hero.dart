import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class PrivacyHero extends StatelessWidget {
  const PrivacyHero({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [

            Color(0xff2563EB),

            Color(0xff1D4ED8),

          ],
        ),
      ),
      child: Column(
        children: [

          Container(
            height: 84,
            width: 84,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Symbols.privacy_tip_rounded,
              size: 42,
              color: Color(0xff2563EB),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Privacy Policy",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            "Your privacy matters.\nDocLock is designed to keep your files secure while respecting your personal information.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(.92),
              fontSize: 15,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 22),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.15),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              "Last Updated • August 02, 2026",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

        ],
      ),
    );
  }
}