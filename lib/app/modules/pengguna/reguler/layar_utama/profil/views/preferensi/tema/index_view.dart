import 'package:doclock_app/core/theme/app_theme_helper.dart';
import 'package:doclock_app/core/widget/navigation/app_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../../../../core/constants/app_color.dart';
import '../../../../../../../../../core/constants/app_typography.dart';
import '../../../../../../../../../localization/locale_keys.dart';
import '../../../../../../../../data/local/isar/models/setelan_akun_model.dart';
import '../../../controllers/preferensi/tema/index_controller.dart';

class IndexPreferensiTemaView extends GetView<IndexPreferensiTemaController> {
  const IndexPreferensiTemaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.background,
      appBar: AppBarPengguna(
        title: LocaleKeys.themePreference.tr,
        onBackPressed: () {
          Get.back();
        },
      ),
      body: Obx(() {
        if (controller.loading.value) {
          return Center(
            child: LoadingAnimationWidget.inkDrop(
              color: AppColor.primary,
              size: 32,
            ),
          );
        }

        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          children: [
            Text(
              LocaleKeys.chooseTheme.tr,
              style: AppTypography.title2().copyWith(
                color: context.appTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              LocaleKeys.chooseThemeDesc.tr,
              style: AppTypography.bodySmall().copyWith(
                color: context.appTheme.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            _itemTema(
              context: context,
              value: TemaAplikasi.sistem,
              title: LocaleKeys.followSystem.tr,
              subtitle: LocaleKeys.followSystemDesc.tr,
              icon: Icons.settings_suggest_rounded,
            ),
            const SizedBox(height: 12),
            _itemTema(
              context: context,
              value: TemaAplikasi.terang,
              title: LocaleKeys.lightTheme.tr,
              subtitle: LocaleKeys.lightThemeDesc.tr,
              icon: Icons.light_mode_rounded,
            ),
            const SizedBox(height: 12),
            _itemTema(
              context: context,
              value: TemaAplikasi.gelap,
              title: LocaleKeys.darkTheme.tr,
              subtitle: LocaleKeys.darkThemeDesc.tr,
              icon: Icons.dark_mode_rounded,
            ),
          ],
        );
      }),
    );
  }

  Widget _itemTema({
    required BuildContext context,
    required TemaAplikasi value,
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    final isSelected = controller.temaDipilih.value == value;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: isSelected ? context.appTheme.surface : context.appTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected
              ? context.appTheme.primary
              : context.appTheme.borderDefault,
          width: isSelected ? 2.0 : 1.0,
        ),
        boxShadow: isSelected
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
          onTap: () {
            controller.pilihTema(value);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? context.appTheme.primary.withOpacity(0.1)
                        : context.appTheme.surfaceVariant,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    size: 22,
                    color: isSelected
                        ? context.appTheme.primary
                        : context.appTheme.textSecondary,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTypography.subhead().copyWith(
                          color: context.appTheme.textPrimary,
                          fontWeight: isSelected
                              ? AppTypography.semiBold
                              : AppTypography.medium,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
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
                      color: isSelected
                          ? context.appTheme.primary
                          : context.appTheme.borderStrong,
                      width: isSelected ? 6 : 2,
                    ),
                    color: isSelected
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
