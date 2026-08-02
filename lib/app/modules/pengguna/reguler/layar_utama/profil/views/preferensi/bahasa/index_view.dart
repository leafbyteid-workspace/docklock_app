import 'package:doclock_app/core/theme/app_theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../../../../core/constants/app_color.dart';
import '../../../../../../../../../core/constants/app_typography.dart';
import '../../../../../../../../../core/widget/navigation/app_appbar.dart';
import '../../../../../../../../../localization/locale_keys.dart';
import '../../../controllers/preferensi/bahasa/index_controller.dart';

class IndexPreferensiBahasaView
    extends GetView<IndexPreferensiBahasaController> {
  const IndexPreferensiBahasaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.background,
      appBar: AppBarPengguna(
        title: LocaleKeys.language.tr,
        onBackPressed: () {
          Get.back();
        },
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: LoadingAnimationWidget.inkDrop(
              color: AppColor.primary,
              size: 32,
            ),
          );
        }

        return ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 24,
          ),
          children: [
            Text(
              LocaleKeys.language.tr,
              style: AppTypography.title2().copyWith(
                color: context.appTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              LocaleKeys.languageDesc.tr,
              style: AppTypography.bodySmall().copyWith(
                color: context.appTheme.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            ...controller.languages.map((language) {
              final selected =
                  controller.selectedLanguage.value == language.code;

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _itemBahasa(
                  context: context,
                  language: language,
                  selected: selected,
                ),
              );
            }),
          ],
        );
      }),
    );
  }

  Widget _itemBahasa({
    required BuildContext context,
    required dynamic language,
    required bool selected,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: context.appTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: selected
              ? context.appTheme.primary
              : context.appTheme.borderDefault,
          width: selected ? 2 : 1,
        ),
        boxShadow: selected
            ? [
                BoxShadow(
                  color: context.appTheme.primary.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          splashColor: context.appTheme.hover,
          highlightColor: context.appTheme.pressed,
          onTap: () async {
            await controller.pilihBahasa(language.code);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: selected
                        ? context.appTheme.primary.withOpacity(0.1)
                        : context.appTheme.surfaceVariant,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      language.flag,
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        language.name,
                        style: AppTypography.subhead().copyWith(
                          color: context.appTheme.textPrimary,
                          fontWeight: selected
                              ? AppTypography.semiBold
                              : AppTypography.medium,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        language.code.toUpperCase(),
                        style: AppTypography.callout().copyWith(
                          color: context.appTheme.textSecondary,
                          fontSize: 13,
                          height: 18 / 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selected
                          ? context.appTheme.primary
                          : context.appTheme.borderStrong,
                      width: selected ? 6 : 2,
                    ),
                    color: selected
                        ? context.appTheme.surface
                        : Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
