import 'package:doclock_app/core/theme/app_theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../app/data/local/isar/models/pengguna_model.dart';
import '../../../localization/locale_keys.dart';
import '../../constants/app_typography.dart';
import '../action/app_button.dart';

class AppInputDialog extends StatefulWidget {
  final String title;
  final String? subtitle;
  final String hintText;
  final String? initialValue;
  final String cancelText;
  final String confirmText;
  final IconData? icon;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool autofocus;
  final int maxLines;
  final String? Function(String value)? validator;

  const AppInputDialog({
    super.key,
    required this.title,
    this.subtitle,
    this.hintText = "",
    this.initialValue,
    this.cancelText = "Batal",
    this.confirmText = "Simpan",
    this.icon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.autofocus = true,
    this.maxLines = 1,
    this.validator,
  });

  @override
  State<AppInputDialog> createState() => _AppInputDialogState();
}

class _AppInputDialogState extends State<AppInputDialog> {
  late final TextEditingController controller;
  String? errorText;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialValue ?? "");
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void submit() {
    final value = controller.text.trim();

    if (widget.validator != null) {
      final error = widget.validator!(value);

      if (error != null) {
        setState(() {
          errorText = error;
        });
        return;
      }
    }

    Get.back(result: value);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          color: context.appTheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: context.appTheme.borderSubtle),
          boxShadow: [
            BoxShadow(
              color: context.appTheme.surfaceVariant.withOpacity(.03),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: context.appTheme.surfaceVariant.withOpacity(.02),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: context.appTheme.primary.withOpacity(.08),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    widget.icon,
                    color: context.appTheme.primary,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 18),
              ],
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: AppTypography.title2(
                  fontWeight: AppTypography.bold,
                ).copyWith(color: context.appTheme.textPrimary),
              ),
              if (widget.subtitle != null) ...[
                const SizedBox(height: 8),
                Text(
                  widget.subtitle!,
                  textAlign: TextAlign.center,
                  style: AppTypography.subhead().copyWith(
                    color: context.appTheme.textSecondary,
                  ),
                ),
              ],
              const SizedBox(height: 22),
              TextField(
                controller: controller,
                autofocus: widget.autofocus,
                keyboardType: widget.keyboardType,
                obscureText: widget.obscureText,
                maxLines: widget.maxLines,
                onSubmitted: (_) => submit(),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  errorText: errorText,
                  filled: true,
                  fillColor: context.appTheme.surface,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 15,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: context.appTheme.borderSubtle,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: context.appTheme.primary,
                      width: 1.5,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.red.shade400),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      text: widget.cancelText,
                      type: AppTipeTombol.secondary,
                      onPressed: () => Get.back(),
                      height: 48,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AppButton(
                      text: widget.confirmText,
                      type: AppTipeTombol.primary,
                      onPressed: submit,
                      height: 48,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppSelectionDialog extends StatefulWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final JenisKelamin? initialValue;

  const AppSelectionDialog({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.initialValue,
  });

  @override
  State<AppSelectionDialog> createState() => _AppSelectionDialogState();
}

class _AppSelectionDialogState extends State<AppSelectionDialog> {
  late JenisKelamin selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialValue ?? JenisKelamin.belumDiisi;
  }

  Widget _buildOption({
    required String title,
    required IconData icon,
    required JenisKelamin value,
  }) {
    final isSelected = selected == value;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        setState(() {
          selected = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected
              ? context.appTheme.primary.withOpacity(.08)
              : Colors.transparent,
          border: Border.all(
            color: isSelected
                ? context.appTheme.primary
                : context.appTheme.borderSubtle,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? context.appTheme.primary
                  : context.appTheme.textSecondary,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: AppTypography.subhead(
                  fontWeight: AppTypography.semiBold,
                ),
              ),
            ),
            Radio<JenisKelamin>(
              value: value,
              groupValue: selected,
              activeColor: context.appTheme.primary,
              onChanged: (value) {
                setState(() {
                  selected = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          color: context.appTheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: context.appTheme.borderSubtle),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: context.appTheme.primary.withOpacity(.08),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    widget.icon,
                    size: 30,
                    color: context.appTheme.primary,
                  ),
                ),
                const SizedBox(height: 18),
              ],
              Text(
                widget.title,
                style: AppTypography.title2(fontWeight: AppTypography.bold),
              ),
              if (widget.subtitle != null) ...[
                const SizedBox(height: 8),
                Text(
                  widget.subtitle!,
                  textAlign: TextAlign.center,
                  style: AppTypography.subhead().copyWith(
                    color: context.appTheme.textSecondary,
                  ),
                ),
              ],
              const SizedBox(height: 24),
              _buildOption(
                title: LocaleKeys.genderMale.tr,
                icon: Icons.male,
                value: JenisKelamin.pria,
              ),

              const SizedBox(height: 16),

              _buildOption(
                title: LocaleKeys.genderFemale.tr,
                icon: Icons.female,
                value: JenisKelamin.wanita,
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      text: "Batal",
                      type: AppTipeTombol.secondary,
                      onPressed: () => Get.back(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AppButton(
                      text: "Simpan",
                      type: AppTipeTombol.primary,
                      onPressed: () {
                        Get.back(result: selected);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppDeleteAccountDialog extends StatefulWidget {
  const AppDeleteAccountDialog({super.key, required this.onDelete});

  final Future<void> Function() onDelete;

  @override
  State<AppDeleteAccountDialog> createState() => _AppDeleteAccountDialogState();
}

class _AppDeleteAccountDialogState extends State<AppDeleteAccountDialog> {
  String get confirmation => LocaleKeys.deleteAccountConfirmation.tr;

  final controller = TextEditingController();

  bool loading = false;

  bool get canDelete =>
      controller.text.trim().toLowerCase() == confirmation.toLowerCase();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> delete() async {
    setState(() {
      loading = true;
    });

    await widget.onDelete();

    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: context.appTheme.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Symbols.warning_amber_rounded,
              color: Colors.red,
              size: 50,
            ),
            const SizedBox(height: 20),
            Text(
              LocaleKeys.deleteAccountTitle.tr,
              style: AppTypography.title2(fontWeight: AppTypography.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "${LocaleKeys.deleteAccountWarning.tr}\n\n"
              "${LocaleKeys.deleteAccountType.tr}\n"
              "\"$confirmation\"\n"
              "${LocaleKeys.startunlockFiles.tr.toLowerCase()}.",
              textAlign: TextAlign.center,
              style: AppTypography.subhead(),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: controller,
              decoration: InputDecoration(hintText: confirmation),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: LocaleKeys.cancel.tr,
                    type: AppTipeTombol.secondary,
                    onPressed: () => Get.back(),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AppButton(
                    text: LocaleKeys.confirmDelete.tr,
                    type: AppTipeTombol.danger,
                    enabled: canDelete,
                    isLoading: loading,
                    onPressed: delete,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
