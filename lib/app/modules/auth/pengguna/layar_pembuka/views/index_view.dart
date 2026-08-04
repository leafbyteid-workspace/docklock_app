import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../core/constants/app_color.dart';
import '../../../../../../core/constants/app_typography.dart';
import '../../../../../../core/utils/responsive_device/responsive_service.dart';
import '../../../../../../localization/locale_keys.dart';
import '../controllers/index_controller.dart';

class LayarPembukaView extends StatelessWidget {
  const LayarPembukaView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<LayarPembukaController>();

    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Responsive.maxContentWidth(context),
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.horizontalPadding(context),
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(flex: 2),
                    SizedBox(
                      width: Responsive.logoSize(context),
                      height: Responsive.logoSize(context),
                      child: Image.asset(
                        'material/assets/logo/doclock-white-logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: Responsive.spacing(context, 24),
                    ),
                    Text(
                      LocaleKeys.splashTitle.tr,
                      textAlign: TextAlign.center,
                      style: AppTypography.title1().copyWith(
                        fontSize: Responsive.titleSize(context),
                        color: AppColor.textInverse,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: Responsive.spacing(context, 16),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 520),
                      child: Text(
                        LocaleKeys.splashDescription.tr,
                        textAlign: TextAlign.center,
                        style: AppTypography.bodySmall().copyWith(
                          fontSize: Responsive.descriptionSize(context),
                          color: AppColor.textInverse,
                          height: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Responsive.spacing(context, 40),
                    ),
                    LoadingAnimationWidget.inkDrop(
                      color: Colors.white,
                      size: Responsive.loadingSize(context),
                    ),
                    const Spacer(flex: 3),
                    Text(
                      "${LocaleKeys.appVersion.tr} 1.0.0",
                      textAlign: TextAlign.center,
                      style: AppTypography.footnote().copyWith(
                        color: AppColor.textInverse,
                      ),
                    ),
                    SizedBox(
                      height: Responsive.spacing(context, 24),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
