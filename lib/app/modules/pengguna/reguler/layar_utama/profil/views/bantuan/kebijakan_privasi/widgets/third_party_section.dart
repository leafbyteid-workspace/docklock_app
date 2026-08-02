import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'privacy_section.dart';

class ThirdPartySection extends StatelessWidget {
  const ThirdPartySection({super.key});

  @override
  Widget build(BuildContext context) {
    return PrivacySection(
      icon: Symbols.handshake_rounded,
      title: "Third-party Services",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "DocLock is designed to operate without relying on third-party cloud services for file storage or synchronization.",
            style: TextStyle(
              height: 1.6,
            ),
          ),
          const SizedBox(height: 20),
          const Card(
            elevation: 0,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Symbols.cloud_off_rounded,
                    color: Colors.green,
                  ),
                  title: Text("Cloud Storage"),
                  subtitle: Text("Not Used"),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(
                    Symbols.analytics_rounded,
                    color: Colors.green,
                  ),
                  title: Text("Analytics"),
                  subtitle: Text("Not Used"),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(
                    Symbols.ads_click_rounded,
                    color: Colors.green,
                  ),
                  title: Text("Advertising"),
                  subtitle: Text("Not Used"),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(
                    Symbols.sync_disabled_rounded,
                    color: Colors.green,
                  ),
                  title: Text("Cloud Synchronization"),
                  subtitle: Text("Not Used"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(.08),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Symbols.check_circle_rounded,
                  color: Colors.green,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "At this time, DocLock does not use third-party services that collect your personal information.",
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
