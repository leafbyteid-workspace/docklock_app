import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'temporary_language_selector.dart';

class TemporaryLanguageDropdown extends GetView<TemporaryLanguageController> {
  const TemporaryLanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),

        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: controller.selectedLanguage.value,

            icon: const Icon(Icons.keyboard_arrow_down, size: 18),

            items: controller.languages.map((language) {
              return DropdownMenuItem<String>(
                value: language["code"],
                child: Row(
                  children: [
                    Text(
                      language["flag"]!,
                      style: const TextStyle(fontSize: 18),
                    ),

                    const SizedBox(width: 8),

                    Text(
                      language["name"]!,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              );
            }).toList(),

            onChanged: (value) {
              if (value != null) {
                controller.changeLanguage(value);
              }
            },
          ),
        ),
      );
    });
  }
}
