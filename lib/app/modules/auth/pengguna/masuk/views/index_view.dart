import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constants/app_color.dart';
import '../../../../../../core/constants/app_typography.dart';
import '../../../../../../core/errors/app_toast.dart';
import '../../../../../../core/utils/responsive_device/responsive_service.dart';
import '../../../../../../core/widget/action/app_button.dart';
import '../../../../../../core/widget/input/app_textfield.dart';
import '../../../../../../localization/locale_keys.dart';
import '../../../../../../localization/temporary_language/temporary_language_dropdown.dart';
import '../../../../../routes/app_pages.dart';
import '../controllers/index_controller.dart';

class IndexMasukPenggunaView extends GetView<IndexMasukPenggunaController> {
  const IndexMasukPenggunaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(Responsive.horizontalPadding(context)),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: Responsive.formWidth(context),
                ),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: SizedBox(
                          width: Responsive.logoSize(context),
                          height: Responsive.logoSize(context),
                          child: Image.asset(
                            'material/assets/logo/doclock-primary-logo.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(height: Responsive.textFieldSpacing(context)),
                      Text(
                        LocaleKeys.login.tr,
                        textAlign: TextAlign.center,
                        style:
                            AppTypography.title2(
                              fontWeight: AppTypography.bold,
                            ).copyWith(
                              fontSize: Responsive.titleSize(context),
                              color: AppColor.textPrimary,
                            ),
                      ),
                      SizedBox(height: Responsive.textFieldSpacing(context)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              Responsive.horizontalPadding(context) * 0.5,
                        ),
                        child: Text(
                          LocaleKeys.loginDescription.tr,
                          textAlign: TextAlign.center,
                          style: AppTypography.bodySmall().copyWith(
                            fontSize: Responsive.descriptionSize(context),
                            color: AppColor.textSecondary,
                          ),
                        ),
                      ),
                      SizedBox(height: Responsive.textFieldSpacing(context)),
                      AppTextField(
                        controller: controller.emailController,
                        label: LocaleKeys.email.tr,
                        hint: LocaleKeys.emailHint.tr,
                        type: AppTextFieldType.email,
                        validator: controller.validasiEmail,
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: Responsive.textFieldSpacing(context)),
                      AppTextField(
                        controller: controller.kataSandiController,
                        label: LocaleKeys.password.tr,
                        hint: LocaleKeys.passwordHint.tr,
                        type: AppTextFieldType.password,
                        validator: controller.validasiKataSandi,
                        textInputAction: TextInputAction.done,
                      ),
                      SizedBox(height: Responsive.sectionSpacing(context)),
                      Obx(() {
                        final isLoading = controller.isLoading.value;

                        return SizedBox(
                          height: Responsive.buttonHeight(context),
                          child: AppButton(
                            type: AppTipeTombol.primary,
                            text: isLoading
                                ? LocaleKeys.processing.tr
                                : LocaleKeys.login.tr,
                            onPressed: isLoading
                                ? null
                                : controller.masukPengguna,
                          ),
                        );
                      }),
                      SizedBox(height: Responsive.textFieldSpacing(context)),
                      SizedBox(
                        height: Responsive.buttonHeight(context),
                        child: AppButton(
                          type: AppTipeTombol.secondary,
                          text: LocaleKeys.noAccountYet.tr,
                          onPressed: () async {
                            final result = await Get.toNamed(
                              Routes.indexDaftarPengguna,
                            );

                            if (result == true) {
                              AppToast.sukses(
                                title: LocaleKeys.registerSuccess.tr,
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(height: Responsive.sectionSpacing(context)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              Responsive.horizontalPadding(context) * 0.4,
                        ),
                        child: Text(
                          LocaleKeys.copyright.tr,
                          textAlign: TextAlign.center,
                          style: AppTypography.bodySmall().copyWith(
                            color: AppColor.textSecondary,
                            fontSize: Responsive.descriptionSize(context) - 1,
                          ),
                        ),
                      ),
                      SizedBox(height: Responsive.sectionSpacing(context)),
                      const TemporaryLanguageDropdown(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
