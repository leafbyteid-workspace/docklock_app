import 'package:doclock_app/core/theme/app_theme_helper.dart';
import 'package:doclock_app/core/widget/action/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../../../core/constants/app_typography.dart';
import '../../../../../../../core/helper/date_helper/format_date.dart';
import '../../../../../../../core/widget/input/app_textfield.dart';
import '../../../../../../../core/widget/navigation/app_appbar.dart';
import '../../../../../../../localization/locale_keys.dart';
import '../controllers/index_controller.dart';

class IndexKunciBerkasView extends GetView<IndexKunciBerkasController> {
  const IndexKunciBerkasView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.background,
      appBar: AppBarPengguna(
        title: LocaleKeys.lockFile.tr,
        onBackPressed: () => Get.back(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Obx(() {
                        return AppTextField(
                          type: AppTextFieldType.file,
                          label: LocaleKeys.selectFile.tr,
                          hint: LocaleKeys.selectFile.tr,
                          file: controller.memilihPlatformBerkas.value,
                          onFileChanged: controller.saatBerkasBerubah,
                        );
                      }),
                      const SizedBox(height: 16),
                      AppTextField(
                        controller: controller.namaBerkasController,
                        label: LocaleKeys.fileName.tr,
                        hint: "${LocaleKeys.fileName.tr}...",
                        type: AppTextFieldType.text,
                        prefix: const Icon(
                          Symbols.description_rounded,
                        ),
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        controller: controller.kataSandiController,
                        label: LocaleKeys.password.tr,
                        hint: LocaleKeys.enterPassword.tr,
                        type: AppTextFieldType.password,
                        required: true,
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        controller: controller.konfirmasiKataSandiController,
                        label: LocaleKeys.confirmPassword.tr,
                        hint: LocaleKeys.repeatPassword.tr,
                        type: AppTextFieldType.password,
                        required: true,
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        controller: controller.petunjukSandiController,
                        label: LocaleKeys.passwordHint.tr,
                        hint: LocaleKeys.passwordHintPlaceholder.tr,
                        prefix: const Icon(
                          Symbols.lightbulb_rounded,
                        ),
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        controller: controller.deskripsiController,
                        label: LocaleKeys.description.tr,
                        hint: LocaleKeys.descriptionPlaceholder.tr,
                        type: AppTextFieldType.multiline,
                        maxLines: 4,
                        minLines: 4,
                        prefix: const Icon(
                          Symbols.notes_rounded,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Obx(() => EnkripsiProsesBar(
                            isVisible: controller.isEncrypting.value,
                            progress: controller.proses.value,
                            title: LocaleKeys.lockingFile.tr,
                            description: LocaleKeys.lockingFileDesc.tr,
                          )),
                      Obx(() {
                        final result = controller.hasilEnkripsi.value;

                        if (result == null) {
                          return const SizedBox();
                        }

                        return Column(
                          children: [
                            const SizedBox(height: 24),
                            _buatKartuHasilEnkripsi(
                              context: context,
                              result: result,
                              onShare: controller.bagikanBerkas,
                              onDownload: controller.unduhBerkas,
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Obx(() {
                final isEncrypting = controller.isEncrypting.value;
                final hasEncryptedResult =
                    controller.hasilEnkripsi.value != null;

                return SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: AppButton(
                    type: isEncrypting
                        ? AppTipeTombol.primary
                        : hasEncryptedResult
                            ? AppTipeTombol.danger
                            : AppTipeTombol.primary,
                    icon: isEncrypting
                        ? Symbols.progress_activity
                        : hasEncryptedResult
                            ? Symbols.lock_reset_rounded
                            : Symbols.lock_rounded,
                    text: isEncrypting
                        ? LocaleKeys.encrypting.tr
                        : hasEncryptedResult
                            ? LocaleKeys.lockAgain.tr
                            : LocaleKeys.startLocking.tr,
                    onPressed: isEncrypting
                        ? null
                        : hasEncryptedResult
                            ? controller.bersihkanFormulir
                            : controller.prosesKunciBerkas,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buatKartuHasilEnkripsi({
  required BuildContext context,
  required dynamic result,
  required VoidCallback onShare,
  required VoidCallback onDownload,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: context.appTheme.surface,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: context.appTheme.borderSubtle,
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: context.appTheme.overlay.withOpacity(0.04),
          blurRadius: 16,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: context.appTheme.success.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.lock_rounded,
                color: context.appTheme.success,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                LocaleKeys.fileLockedSuccess.tr,
                style: AppTypography.title3(
                  fontWeight: AppTypography.semiBold,
                ).copyWith(
                  color: context.appTheme.textPrimary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Divider(
          color: context.appTheme.divider,
          height: 1,
        ),
        const SizedBox(height: 16),
        _buatMenuInformasi(
          context: context,
          label: LocaleKeys.originalName.tr,
          value: result.originalName,
        ),
        const SizedBox(height: 8),
        _buatMenuInformasi(
          context: context,
          label: LocaleKeys.encryptedFileName.tr,
          value: result.encryptedName,
        ),
        const SizedBox(height: 8),
        _buatMenuInformasi(
          context: context,
          label: LocaleKeys.fileSize.tr,
          value: result.size,
        ),
        const SizedBox(height: 8),
        _buatMenuInformasi(
          context: context,
          label: LocaleKeys.lockedDate.tr,
          value: formatTanggal(result.encryptedAt),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: AppButton(
                text: LocaleKeys.share.tr,
                type: AppTipeTombol.secondary,
                icon: Icons.share_outlined,
                onPressed: onShare,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AppButton(
                text: LocaleKeys.downloadFile.tr,
                type: AppTipeTombol.primary,
                icon: Icons.file_download_outlined,
                onPressed: onDownload,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buatMenuInformasi(
    {required BuildContext context,
    required String label,
    required String value}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: 90,
        child: Text(
          label,
          style: AppTypography.subhead().copyWith(
            color: context.appTheme.textSecondary,
          ),
        ),
      ),
      Text(
        ": ",
        style: AppTypography.subhead().copyWith(
          color: context.appTheme.textSecondary,
        ),
      ),
      Expanded(
        child: Text(
          value,
          style:
              AppTypography.subhead(fontWeight: AppTypography.medium).copyWith(
            color: context.appTheme.textPrimary,
          ),
        ),
      ),
    ],
  );
}

class EnkripsiProsesBar extends StatelessWidget {
  final double progress;
  final bool isVisible;
  final String title;
  final String? description;

  const EnkripsiProsesBar({
    super.key,
    required this.progress,
    required this.isVisible,
    required this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final safeProgress = progress.clamp(0.0, 1.0);
    final percentage = (safeProgress * 100).toStringAsFixed(0);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: !isVisible
          ? const SizedBox.shrink()
          : Container(
              key: const ValueKey('encryption_progress'),
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: theme.colorScheme.primary.withOpacity(0.15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(
                          Icons.lock_outline_rounded,
                          color: theme.colorScheme.primary,
                          size: 25,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              description ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurface
                                    .withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        '$percentage%',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(
                        begin: 0,
                        end: safeProgress,
                      ),
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeOutCubic,
                      builder: (context, animatedValue, child) {
                        return LinearProgressIndicator(
                          value: animatedValue,
                          minHeight: 9,
                          backgroundColor:
                              theme.colorScheme.primary.withOpacity(
                            0.10,
                          ),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            theme.colorScheme.primary,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    safeProgress >= 1
                        ? LocaleKeys.encryptionCompleted.tr
                        : LocaleKeys.encryptionProcessing.tr,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: safeProgress >= 1
                          ? Colors.green
                          : theme.colorScheme.onSurface.withOpacity(0.55),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
