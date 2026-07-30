import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/data/local/isar/services/main/isar_service.dart';
import 'app/routes/app_pages.dart';
import 'core/service/app/open_file_service.dart';
import 'core/widget/action/app_button.dart';
import 'core/constants/app_color.dart';
import 'core/constants/app_typography.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
    };

    await _initializeApp();

    OpenFileService.listen((uri) async {
      Get.toNamed(
        Routes.indexBukaKunciBerkas,
        arguments: uri,
      );
    });

    runApp(const MyApp());
  }, (error, stackTrace) {});
}

Future<void> _initializeApp() async {
  await IsarService.instance.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Application',
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      transitionDuration: Duration.zero,
      builder: (context, child) {
        ErrorWidget.builder = (FlutterErrorDetails details) {
          return Material(
            color: AppColor.background,
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 480,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColor.danger.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.error_outline_rounded,
                              color: AppColor.danger,
                              size: 40,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Oops! Terjadi Kesalahan',
                            textAlign: TextAlign.center,
                            style: AppTypography.title2().copyWith(
                              color: AppColor.textPrimary,
                              fontWeight: AppTypography.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Terjadi kesalahan saat menjalankan aplikasi. '
                            'Silakan coba kembali beberapa saat lagi atau hubungi '
                            'support@yourapp.com untuk bantuan lebih lanjut.',
                            textAlign: TextAlign.center,
                            style: AppTypography.bodySmall().copyWith(
                              color: AppColor.textSecondary,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 32),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColor.neutral100,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColor.borderSubtle,
                              ),
                            ),
                            child: Text(
                              kDebugMode
                                  ? details.exceptionAsString()
                                  : 'Aplikasi mengalami kendala tidak terduga. Silakan coba kembali beberapa saat lagi.',
                              textAlign: TextAlign.center,
                              style: AppTypography.bodySmall().copyWith(
                                color: AppColor.textSecondary,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: AppButton(
                              text: 'Kembali Ke Beranda',
                              type: AppTipeTombol.primary,
                              height: 48,
                              onPressed: () {
                                Navigator.of(context).maybePop();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        };
        return child ?? const SizedBox.shrink();
      },
    );
  }
}
