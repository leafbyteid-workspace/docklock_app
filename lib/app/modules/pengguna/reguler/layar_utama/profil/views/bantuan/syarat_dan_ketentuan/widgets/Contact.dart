import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../kebijakan_privasi/widgets/privacy_section.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PrivacySection(
      icon: Symbols.contact_support_rounded,
      title: "Contact Us",
      child: Card(
        elevation: 0,
        child: Column(
          children: const [
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
              leading: Icon(Symbols.support_agent_rounded),
              title: Text("Support"),
              subtitle: Text(
                "Questions regarding Terms & Conditions",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
