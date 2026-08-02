import 'package:doclock_app/core/theme/app_theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../core/constants/app_typography.dart';
import '../../../../../../../../../../core/widget/action/app_button.dart';
import '../../../../../../../../../../core/widget/input/app_textfield.dart';
import '../../../../../../../../../../core/widget/navigation/app_appbar.dart';
import '../../../../../../../../../../localization/locale_keys.dart';
import '../../../../controllers/akun/keamanan_akun/ubah_sandi/index_controller.dart';

class IndexKeamananAkunUbahSandiView
    extends GetView<IndexKeamananAkunUbahSandiController> {
  const IndexKeamananAkunUbahSandiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPengguna(
        title: LocaleKeys.changePassword.tr,
      ),
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text(
                LocaleKeys.accountSecurityTitle.tr,
                style: AppTypography.title2(
                  fontWeight: AppTypography.bold,
                ).copyWith(
                  color: context.appTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                LocaleKeys.accountSecurityInstruction.tr,
                style: AppTypography.bodySmall().copyWith(
                  color: context.appTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 0,
                color: context.appTheme.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: context.appTheme.borderDefault,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      AppTextField(
                        controller: controller.sandiLamaController,
                        type: AppTextFieldType.password,
                        label: LocaleKeys.currentPassword.tr,
                        hint: LocaleKeys.currentPasswordHint.tr,
                        validator: controller.validatorSandiLama,
                        required: true,
                      ),
                      const SizedBox(height: 20),
                      AppTextField(
                        controller: controller.sandiBaruController,
                        type: AppTextFieldType.password,
                        label: LocaleKeys.newPassword.tr,
                        hint: LocaleKeys.newPasswordHint.tr,
                        validator: controller.validatorSandiBaru,
                        required: true,
                      ),
                      const SizedBox(height: 20),
                      AppTextField(
                        controller: controller.konfirmasiController,
                        type: AppTextFieldType.password,
                        label: LocaleKeys.confirmNewPassword.tr,
                        hint: LocaleKeys.confirmNewPasswordHint.tr,
                        validator: controller.validatorKonfirmasi,
                        required: true,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Obx(
                () => AppButton(
                  text: LocaleKeys.savePassword.tr,
                  height: 50,
                  isLoading: controller.isLoading.value,
                  enabled: !controller.isLoading.value,
                  onPressed: controller.ubahSandi,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                LocaleKeys.passwordRequirement.tr,
                textAlign: TextAlign.center,
                style: AppTypography.helper.copyWith(
                  color: context.appTheme.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
