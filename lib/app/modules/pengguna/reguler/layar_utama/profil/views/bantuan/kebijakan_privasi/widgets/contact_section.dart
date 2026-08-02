import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'privacy_section.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const PrivacySection(
      icon: Symbols.contact_support_rounded,
      title: "Contact Us",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "If you have any questions about this Privacy Policy or the use of DocLock, you may contact us using the information below.",
            style: TextStyle(
              height: 1.6,
            ),
          ),
          SizedBox(height: 20),
          Card(
            elevation: 0,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Symbols.apps_rounded),
                  title: Text("Application"),
                  subtitle: Text("DocLock"),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Symbols.email_rounded),
                  title: Text("Email"),
                  subtitle: Text("leafbyteid@gmail.com"),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Symbols.security_rounded),
                  title: Text("Privacy Support"),
                  subtitle: Text(
                    "Questions, suggestions, and privacy requests",
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
