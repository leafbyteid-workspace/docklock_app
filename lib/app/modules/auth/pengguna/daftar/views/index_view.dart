import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constants/app_color.dart';
import '../../../../../../core/constants/app_typography.dart';
import '../../../../../../core/utils/responsive_device/responsive_service.dart';
import '../../../../../../core/widget/action/app_button.dart';
import '../../../../../../core/widget/input/app_textfield.dart';
import '../../../../../../localization/locale_keys.dart';
import '../../../../../routes/app_pages.dart';
import '../controllers/index_controller.dart';

class IndexDaftarPenggunaView extends GetView<IndexDaftarPenggunaController> {
  const IndexDaftarPenggunaView({super.key});
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
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        LocaleKeys.register.tr,
                        style:
                            AppTypography.title2(
                              fontWeight: AppTypography.bold,
                            ).copyWith(
                              fontSize: Responsive.titleSize(context),
                              color: AppColor.textPrimary,
                            ),
                      ),
                      SizedBox(height: Responsive.sectionSpacing(context)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              Responsive.horizontalPadding(context) * 0.5,
                        ),
                        child: Text(
                          LocaleKeys.createAccountDesc.tr,
                          textAlign: TextAlign.center,
                          style: AppTypography.bodySmall().copyWith(
                            fontSize: Responsive.descriptionSize(context),
                            color: AppColor.textSecondary,
                          ),
                        ),
                      ),
                      SizedBox(height: Responsive.sectionSpacing(context)),
                      AppTextField(
                        controller: controller.namaLengkapController,
                        label: LocaleKeys.fullName.tr,
                        hint: LocaleKeys.fullNameHint.tr,
                        type: AppTextFieldType.text,
                        validator: controller.validasiNamaLengkap,
                        textInputAction: TextInputAction.next,
                        prefix: const Icon(Icons.person_outline_rounded),
                      ),
                      SizedBox(height: Responsive.textFieldSpacing(context)),
                      AppTextField(
                        controller: controller.namaPenggunaController,
                        label: LocaleKeys.username.tr,
                        hint: LocaleKeys.usernameHint.tr,
                        type: AppTextFieldType.text,
                        validator: controller.validasiNamaPengguna,
                        textInputAction: TextInputAction.next,
                        prefix: const Icon(Icons.person_outline_rounded),
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
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: Responsive.textFieldSpacing(context)),
                      AppTextField(
                        controller: controller.konfirmasiKataSandiController,
                        label: LocaleKeys.confirmPassword.tr,
                        hint: LocaleKeys.confirmPasswordHint.tr,
                        type: AppTextFieldType.password,
                        validator: controller.validasiKonfirmasiKataSandi,
                        textInputAction: TextInputAction.done,
                      ),
                      SizedBox(
                        height: Responsive.sectionSpacing(context) * 1.5,
                      ),
                      Obx(() {
                        final isLoading = controller.isLoading.value;

                        return SizedBox(
                          width: double.infinity,
                          height: Responsive.buttonHeight(context),
                          child: AppButton(
                            type: AppTipeTombol.primary,
                            text: isLoading
                                ? LocaleKeys.processing.tr
                                : LocaleKeys.register.tr,
                            onPressed: isLoading
                                ? null
                                : () {
                                    controller.daftarPengguna();
                                  },
                          ),
                        );
                      }),
                      SizedBox(height: Responsive.textFieldSpacing(context)),
                      SizedBox(
                        width: double.infinity,
                        height: Responsive.buttonHeight(context),
                        child: AppButton(
                          type: AppTipeTombol.secondary,
                          text: LocaleKeys.alreadyHaveAccount.tr,
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                      SizedBox(height: Responsive.textFieldSpacing(context)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              Responsive.horizontalPadding(context) * 0.4,
                        ),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: AppTypography.bodySmall().copyWith(
                              fontSize: Responsive.descriptionSize(context),
                              color: AppColor.primary,
                              fontWeight: AppTypography.semiBold,
                            ),
                            children: [
                              TextSpan(
                                text: LocaleKeys.agreeRegister.tr,
                                style: const TextStyle(
                                  color: AppColor.textTertiary,
                                ),
                              ),
                              TextSpan(
                                text: LocaleKeys.termsAndConditions.tr,
                                style: AppTypography.bodySmall().copyWith(
                                  color: AppColor.primary,
                                  fontWeight: AppTypography.semiBold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(Routes.indexSyaratdanKetentuan);
                                  },
                              ),
                              TextSpan(
                                text: LocaleKeys.and.tr,
                                style: const TextStyle(
                                  color: AppColor.textTertiary,
                                ),
                              ),
                              TextSpan(
                                text: LocaleKeys.privacyPolicy.tr,
                                style: AppTypography.bodySmall().copyWith(
                                  color: AppColor.primary,
                                  fontWeight: AppTypography.semiBold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(Routes.indexKebijakanPrivasi);
                                  },
                              ),
                              const TextSpan(text: '.'),
                            ],
                          ),
                        ),
                      ),
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
