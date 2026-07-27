import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constants/app_color.dart';
import '../../../../../../core/constants/app_typography.dart';
import '../../../../../../core/widget/action/app_button.dart';
import '../../../../../../core/widget/input/app_textfield.dart';
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
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 480,
                ),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.asset(
                            'material/assets/logo/doclock-primary-logo.png',
                            width: 104,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Daftar',
                          style: AppTypography.title2(
                            fontWeight: AppTypography.bold,
                          ).copyWith(
                            color: AppColor.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Buat akun untuk mulai melindungi dokumen penting Anda.',
                            textAlign: TextAlign.center,
                            style: AppTypography.bodySmall().copyWith(
                              color: AppColor.textSecondary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        AppTextField(
                          controller: controller.namaLengkapController,
                          label: "Nama Lengkap",
                          hint: "Masukkan Nama Lengkap...",
                          type: AppTextFieldType.text,
                          validator: controller.validasiNamaLengkap,
                          textInputAction: TextInputAction.next,
                          prefix: const Icon(Icons.person_outline_rounded),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AppTextField(
                          controller: controller.namaPenggunaController,
                          label: "Nama Pengguna",
                          hint: "Masukkan Nama Pengguna...",
                          type: AppTextFieldType.text,
                          validator: controller.validasiNamaPengguna,
                          textInputAction: TextInputAction.next,
                          prefix: const Icon(Icons.person_outline_rounded),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AppTextField(
                          controller: controller.emailController,
                          label: "Email",
                          hint: "Masukkan Email...",
                          type: AppTextFieldType.email,
                          validator: controller.validasiEmail,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AppTextField(
                          controller: controller.kataSandiController,
                          label: "Kata Sandi",
                          hint: "Masukkan Kata Sandi...",
                          type: AppTextFieldType.password,
                          validator: controller.validasiKataSandi,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AppTextField(
                          controller: controller.konfirmasiKataSandiController,
                          label: "Ulangi Kata Sandi",
                          hint: "Masukkan Ulang Kata Sandi...",
                          type: AppTextFieldType.password,
                          validator: controller.validasiKonfirmasiKataSandi,
                          textInputAction: TextInputAction.done,
                        ),
                        const SizedBox(
                          height: 56,
                        ),
                        Obx(() {
                          final isLoading = controller.isLoading.value;

                          return SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: AppButton(
                              type: AppTipeTombol.primary,
                              text: isLoading ? "Memproses..." : "Daftar",
                              onPressed: isLoading
                                  ? null
                                  : () {
                                      controller.daftarPengguna();
                                    },
                            ),
                          );
                        }),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: AppButton(
                            type: AppTipeTombol.secondary,
                            text: "Sudah Punya Akun?",
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text.rich(
                            TextSpan(
                              text: 'Dengan mendaftar, Anda menyetujui ',
                              style: AppTypography.bodySmall().copyWith(
                                color: AppColor.textSecondary,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Syarat & Ketentuan',
                                  style: AppTypography.bodySmall().copyWith(
                                    color: AppColor.primary,
                                    fontWeight: AppTypography.semiBold,
                                  ),
                                ),
                                const TextSpan(
                                  text: ' serta ',
                                ),
                                TextSpan(
                                  text: 'Kebijakan Privasi',
                                  style: AppTypography.bodySmall().copyWith(
                                    color: AppColor.primary,
                                    fontWeight: AppTypography.semiBold,
                                  ),
                                ),
                                const TextSpan(
                                  text: '.',
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
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
      ),
    );
  }
}
