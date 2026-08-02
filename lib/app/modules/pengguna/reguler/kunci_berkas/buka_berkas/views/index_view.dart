import 'package:doclock_app/core/theme/app_theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../../../core/constants/app_typography.dart';
import '../../../../../../../core/helper/date_helper/format_date.dart';
import '../../../../../../../core/widget/action/app_button.dart';
import '../../../../../../../core/widget/input/app_textfield.dart';
import '../../../../../../../core/widget/navigation/app_appbar.dart';
import '../../../../../../../localization/locale_keys.dart';
import '../../../../../../data/services/PBE_encryption/enkripsi_metadata.dart';
import '../controllers/index_controller.dart';

class IndexBukaKunciBerkasView extends GetView<IndexBukaKunciBerkasController> {
  const IndexBukaKunciBerkasView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.background,
      appBar: AppBarPengguna(
        title: LocaleKeys.unlockFile.tr,
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
                      Obx(
                        () => AppTextField(
                          type: AppTextFieldType.file,
                          label: LocaleKeys.encryptedFile.tr,
                          hint: LocaleKeys.selectEncryptedFile.tr,
                          file: controller.memilihPlatformBerkas.value,
                          onFileChanged: controller.saatBerkasBerubah,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Obx(() {
                        final metadata = controller.metadata.value;

                        if (metadata == null) {
                          return const Column(
                            children: [
                              DekripsiKondisiKosong(),
                              SizedBox(height: 16),
                            ],
                          );
                        }

                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 350),
                          child: Column(
                            children: [
                              _membuatKartuMetadata(context, metadata),
                              const SizedBox(height: 16),
                            ],
                          ),
                        );
                      }),
                      AppTextField(
                        controller: controller.kataSandiController,
                        label: LocaleKeys.password.tr,
                        hint: LocaleKeys.enterPassword.tr,
                        required: true,
                        type: AppTextFieldType.password,
                      ),
                      const SizedBox(height: 24),
                      Obx(() => ProsesDekripsiBar(
                            isVisible: controller.isDecrypting.value,
                            progress: controller.proses.value,
                            title: LocaleKeys.openingFile.tr,
                            description: LocaleKeys.openingFileDesc.tr,
                          )),
                      Obx(() {
                        final result = controller.hasilDekripsi.value;

                        if (result == null) {
                          return const SizedBox();
                        }

                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 350),
                          child: Column(
                            children: [
                              const SizedBox(height: 24),
                              _membuatKartuHasilDekripsi(
                                context: context,
                                result: result,
                                onShare: controller.bagikanBerkas,
                                onDownload: controller.unduhBerkas,
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Obx(() {
                final decrypting = controller.isDecrypting.value;

                final finished = controller.hasilDekripsi.value != null;

                return SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: AppButton(
                    type: decrypting
                        ? AppTipeTombol.primary
                        : finished
                            ? AppTipeTombol.danger
                            : AppTipeTombol.primary,
                    icon: decrypting
                        ? Symbols.progress_activity
                        : finished
                            ? Symbols.lock_reset
                            : Symbols.lock_open_right,
                    text: decrypting
                        ? LocaleKeys.opening.tr
                        : finished
                            ? LocaleKeys.openAnotherFile.tr
                            : LocaleKeys.unlockFile.tr,
                    onPressed: decrypting
                        ? null
                        : finished
                            ? controller.bersihkanFormulir
                            : controller.prosesDekripsi,
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

Widget _membuatKartuMetadata(
  BuildContext context,
  EnkripsiMetadataModel metadata,
) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: context.appTheme.surface,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: context.appTheme.borderSubtle,
      ),
      boxShadow: [
        BoxShadow(
          color: context.appTheme.overlay.withOpacity(.04),
          blurRadius: 18,
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
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: context.appTheme.primary.withOpacity(.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Symbols.description_rounded,
                color: context.appTheme.primary,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                LocaleKeys.fileInformation.tr,
                style: AppTypography.title3(
                  fontWeight: AppTypography.semiBold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 16),
        _buatMenuInformasi(
          context,
          LocaleKeys.fileName.tr,
          metadata.originalFileName,
        ),
        const SizedBox(height: 8),
        _buatMenuInformasi(
          context,
          LocaleKeys.description.tr,
          metadata.description.isEmpty ? "-" : metadata.description,
        ),
        const SizedBox(height: 8),
        _buatMenuInformasi(
          context,
          LocaleKeys.passwordHint.tr,
          metadata.hint.isEmpty ? "-" : metadata.hint,
        ),
        const SizedBox(height: 8),
        _buatMenuInformasi(
          context,
          LocaleKeys.createdAt.tr,
          formatTanggal(metadata.createdAt),
        ),
        const SizedBox(height: 8),
        _buatMenuInformasi(
          context,
          LocaleKeys.fileSize.tr,
          metadata.readableSize,
        ),
        const SizedBox(height: 8),
        _buatMenuInformasi(
          context,
          LocaleKeys.fileType.tr,
          metadata.mimeType,
        ),
        const SizedBox(height: 8),
        _buatMenuInformasi(
          context,
          LocaleKeys.extension.tr,
          metadata.originalExtension,
        ),
        const SizedBox(height: 8),
        _buatMenuInformasi(
          context,
          LocaleKeys.version.tr,
          metadata.formatVersion,
        ),
      ],
    ),
  );
}

Widget _membuatKartuHasilDekripsi({
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
      ),
      boxShadow: [
        BoxShadow(
          color: context.appTheme.overlay.withOpacity(.04),
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
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: context.appTheme.success.withOpacity(.10),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Symbols.lock_open_rounded,
                color: context.appTheme.success,
                size: 22,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                LocaleKeys.fileOpenedSuccess.tr,
                style: AppTypography.title3(
                  fontWeight: AppTypography.semiBold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 16),
        _buatMenuInformasi(
          context,
          LocaleKeys.fileName.tr,
          result.originalName,
        ),
        const SizedBox(height: 8),
        _buatMenuInformasi(
          context,
          LocaleKeys.sourceFile.tr,
          result.encryptedName,
        ),
        const SizedBox(height: 8),
        _buatMenuInformasi(
          context,
          LocaleKeys.fileSize.tr,
          result.size,
        ),
        const SizedBox(height: 8),
        _buatMenuInformasi(
          context,
          LocaleKeys.lockedDate.tr,
          formatTanggal(
            result.encryptedAt,
          ),
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
  BuildContext context,
  String label,
  String value,
) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: 95,
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
          style: AppTypography.subhead(
            fontWeight: AppTypography.medium,
          ).copyWith(
            color: context.appTheme.textPrimary,
          ),
        ),
      ),
    ],
  );
}

class DekripsiKondisiKosong extends StatelessWidget {
  const DekripsiKondisiKosong({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        color: context.appTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.appTheme.borderSubtle,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: context.appTheme.primary.withOpacity(.08),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Symbols.lock_open_rounded,
              size: 34,
              color: context.appTheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            LocaleKeys.noEncryptedFile.tr,
            style: AppTypography.title3(
              fontWeight: AppTypography.semiBold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            LocaleKeys.noEncryptedFileDesc.tr,
            textAlign: TextAlign.center,
            style: AppTypography.bodyPrimary().copyWith(
              color: context.appTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class ProsesDekripsiBar extends StatelessWidget {
  final double progress;
  final bool isVisible;
  final String title;
  final String? description;

  const ProsesDekripsiBar({
    super.key,
    required this.progress,
    required this.isVisible,
    this.title = 'Mendekripsi Berkas',
    this.description = 'Mohon tunggu, proses sedang berlangsung...',
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
              key: const ValueKey('decryption_progress'),
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
                          Symbols.lock_outline_rounded,
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
                        ? LocaleKeys.decryptionCompleted.tr
                        : LocaleKeys.decryptionProcessing.tr,
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
