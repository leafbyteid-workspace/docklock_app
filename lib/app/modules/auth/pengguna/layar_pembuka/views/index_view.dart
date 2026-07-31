import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../core/constants/app_color.dart';
import '../../../../../../core/constants/app_typography.dart';
import '../controllers/index_controller.dart';

class LayarPembukaView extends GetView<LayarPembukaController> {
  const LayarPembukaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  FractionallySizedBox(
                    widthFactor: 0.3,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          'material/assets/logo/doclock-white-logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "DocLock",
                      style: AppTypography.title1().copyWith(
                        color: AppColor.textInverse,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Lindungi dokumen penting dengan\n"
                    "keamanan yang hanya dapat Anda akses.",
                    textAlign: TextAlign.center,
                    style: AppTypography.bodySmall().copyWith(
                      color: AppColor.textInverse,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 40),
                  LoadingAnimationWidget.inkDrop(
                    color: Colors.white,
                    size: 48,
                  ),
                  const Spacer(flex: 3),
                  Text(
                    "Version 1.0.0",
                    style: AppTypography.footnote().copyWith(
                      color: AppColor.textInverse,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
