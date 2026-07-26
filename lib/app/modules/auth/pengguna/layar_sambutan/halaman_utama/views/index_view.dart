import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../../../core/constants/app_color.dart';
import '../../../../../../../core/constants/app_typography.dart';
import '../../../../../../../core/widget/action/app_button.dart';
import '../../../../../../routes/app_pages.dart';
import '../controllers/index_controller.dart';

class IndexHalamanUtamaView extends GetView<IndexHalamanUtamaController> {
  const IndexHalamanUtamaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const Spacer(),
                  Image.asset(
                    "material/assets/logo/doclock-primary-logo.png",
                    height: 156,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.hover,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Symbols.verified_user_rounded,
                          color: AppColor.primary,
                          size: 18,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Data Tetap Aman",
                          style: TextStyle(
                            color: AppColor.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Privasi Berkas Terjaga",
                    textAlign: TextAlign.center,
                    style: AppTypography.title1().copyWith(
                      color: AppColor.textPrimary,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Lindungi berkas pribadi Anda "
                    "dengan cepat dan aman.",
                    textAlign: TextAlign.center,
                    style: AppTypography.bodyPrimary().copyWith(
                      color: AppColor.textSecondary,
                    ),
                  ),
                  const Spacer(),
                  AppButton(
                    text: "Mulai Sekarang",
                    onPressed: () {
                      Get.offAllNamed(Routes.mainNavigasiPengguna);
                    },
                  ),
                  const SizedBox(height: 56),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
