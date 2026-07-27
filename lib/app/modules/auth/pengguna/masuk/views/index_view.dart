import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constants/app_color.dart';
import '../../../../../../core/constants/app_typography.dart';
import '../../../../../../core/errors/app_toast.dart';
import '../../../../../../core/widget/action/app_button.dart';
import '../../../../../../core/widget/input/app_textfield.dart';
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
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 480,
                ),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Image.asset(
                          'material/assets/logo/doclock-primary-logo.png',
                          width: 104,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Masuk',
                        textAlign: TextAlign.center,
                        style: AppTypography.title2(
                          fontWeight: AppTypography.bold,
                        ).copyWith(
                          color: AppColor.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Keamanan data dimulai dari sini. Masuk ke akun DocLock Anda.',
                          textAlign: TextAlign.center,
                          style: AppTypography.bodySmall().copyWith(
                            color: AppColor.textSecondary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      AppTextField(
                        controller: controller.emailController,
                        label: "Email",
                        hint: "Masukkan Email...",
                        type: AppTextFieldType.email,
                        validator: controller.validasiEmail,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        controller: controller.kataSandiController,
                        label: "Kata Sandi",
                        hint: "Masukkan Kata Sandi...",
                        type: AppTextFieldType.password,
                        validator: controller.validasiKataSandi,
                        textInputAction: TextInputAction.done,
                      ),
                      const SizedBox(height: 32),
                      Obx(() {
                        final isLoading = controller.isLoading.value;

                        return SizedBox(
                          height: 48,
                          child: AppButton(
                            type: AppTipeTombol.primary,
                            text: isLoading ? "Memproses..." : "Masuk",
                            onPressed:
                                isLoading ? null : controller.masukPengguna,
                          ),
                        );
                      }),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 48,
                        child: AppButton(
                          type: AppTipeTombol.secondary,
                          text: "Belum Punya Akun?",
                          onPressed: () async {
                            final result = await Get.toNamed(
                              Routes.indexDaftarPengguna,
                            );

                            if (result == true) {
                              AppToast.sukses(
                                title: "Pendaftaraan berhasil",
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          '© 2026 Doclock. All rights reserved.',
                          textAlign: TextAlign.center,
                          style: AppTypography.bodySmall().copyWith(
                            color: AppColor.textSecondary,
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
