import 'package:doclock_app/core/widget/action/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../../../core/constants/app_color.dart';
import '../../../../../../../core/constants/app_typography.dart';
import '../../../../../../../core/widget/input/app_textfield.dart';
import '../../../../../../../core/widget/navigation/app_appbar.dart';
import '../controllers/index_controller.dart';

class IndexKunciBerkasView extends GetView<IndexKunciBerkasController> {
  const IndexKunciBerkasView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBarPengguna(
        title: "Kunci Berkas",
        actionIcon1: Symbols.more_vert,
        onAction1: () {},
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
                      /// FILE
                      Obx(() {
                        return AppTextField(
                          type: AppTextFieldType.file,
                          label: "Pilih Berkas",
                          hint: "Pilih Berkas",
                          file: controller.selectedPlatformFile.value,
                          onFileChanged: controller.onFileChanged,
                        );
                      }),

                      const SizedBox(height: 16),

                      /// NAMA FILE
                      AppTextField(
                        controller: controller.fileNameController,
                        label: "Nama Berkas",
                        type: AppTextFieldType.text,
                        hint: "Nama Berkas...",
                        prefix: const Icon(
                          Symbols.description_rounded,
                        ),
                      ),

                      const SizedBox(height: 16),

                      /// PASSWORD
                      AppTextField(
                        controller: controller.passwordController,
                        label: "Kata Sandi",
                        type: AppTextFieldType.password,
                        required: true,
                        hint: "Masukkan kata sandi...",
                      ),

                      const SizedBox(height: 16),

                      /// KONFIRMASI PASSWORD
                      AppTextField(
                        controller: controller.confirmPasswordController,
                        label: "Konfirmasi Kata Sandi",
                        type: AppTextFieldType.password,
                        required: true,
                        hint: "Ulangi kata sandi...",
                      ),

                      const SizedBox(height: 16),

                      /// HINT
                      AppTextField(
                        controller: controller.hintController,
                        label: "Petunjuk Kata Sandi",
                        hint: "Petunjuk untuk mengingat kata sandi",
                        prefix: const Icon(
                          Symbols.lightbulb_rounded,
                        ),
                      ),

                      const SizedBox(height: 16),

                      /// DESKRIPSI
                      AppTextField(
                        controller: controller.descriptionController,
                        label: "Deskripsi",
                        hint: "Tambahkan deskripsi berkas...",
                        type: AppTextFieldType.multiline,
                        maxLines: 4,
                        minLines: 4,
                        prefix: const Icon(
                          Symbols.notes_rounded,
                        ),
                      ),

                      const SizedBox(height: 24),

                      Obx(
                        () => EncryptionProgressBar(
                          isVisible: controller.isEncrypting.value,
                          progress: controller.progress.value,
                          title: 'Mengenkripsi Data',
                          description:
                              'File sedang diamankan menggunakan enkripsi',
                        ),
                      ),

                      Obx(() {
                        final result = controller.encryptedResult.value;

                        if (result == null) {
                          return const SizedBox();
                        }

                        return Column(
                          children: [
                            const SizedBox(height: 24),
                            _buildEncryptedResultCard(
                              result: result,
                              onOpen: controller.bukaFile,
                              onShare: controller.shareFile,
                              onDownload: controller.downloadFile,
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Obx(() {
                final isEncrypting = controller.isEncrypting.value;
                final hasEncryptedResult =
                    controller.encryptedResult.value != null;

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
                        ? "Sedang Mengenkripsi..."
                        : hasEncryptedResult
                            ? "Kunci Berkas Ulang"
                            : "Lakukan Penguncian",
                    onPressed: isEncrypting
                        ? null
                        : hasEncryptedResult
                            ? controller.resetFormulir
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

Widget _buildEncryptedResultCard({
  required dynamic result,
  required VoidCallback onOpen,
  required VoidCallback onShare,
  required VoidCallback onDownload,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColor.surface,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: AppColor.borderSubtle,
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColor.overlay.withOpacity(0.04),
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
                color: AppColor.success.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.lock_rounded,
                color: AppColor.success,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                "Berkas Berhasil Dikunci",
                style: AppTypography.title3(
                  fontWeight: AppTypography.semiBold,
                ).copyWith(
                  color: AppColor.textPrimary,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        const Divider(
          color: AppColor.divider,
          height: 1,
        ),

        const SizedBox(height: 16),

        _buildInfoRow(
          label: "Nama Asli",
          value: result.originalName,
        ),
        const SizedBox(height: 8),

        _buildInfoRow(
          label: "Nama File",
          value: result.encryptedName,
        ),
        const SizedBox(height: 8),

        _buildInfoRow(
          label: "Ukuran",
          value: result.size,
        ),
        const SizedBox(height: 8),

        _buildInfoRow(
          label: "Tanggal",
          value: result.encryptedAt.toString(),
        ),

        const SizedBox(height: 24),

        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onOpen,
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColor.primary,
                  side: const BorderSide(
                    color: AppColor.borderDefault,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(
                  Icons.folder_open_rounded,
                  size: 18,
                ),
                label: Text(
                  "Buka",
                  style: AppTypography.buttonSecondary.copyWith(
                    color: AppColor.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onShare,
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColor.textPrimary,
                  side: const BorderSide(
                    color: AppColor.borderDefault,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(
                  Icons.share_outlined,
                  size: 18,
                ),
                label: Text(
                  "Bagikan",
                  style: AppTypography.buttonSecondary.copyWith(
                    color: AppColor.textPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        /// TOMBOL DOWNLOAD
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: onDownload,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary,
              foregroundColor: AppColor.onPrimary,
              elevation: 0,
              padding: const EdgeInsets.symmetric(
                vertical: 14,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            icon: const Icon(
              Icons.file_download_outlined,
              size: 20,
            ),
            label: Text(
              "Download",
              style: AppTypography.buttonPrimary.copyWith(
                color: AppColor.onPrimary,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildInfoRow({required String label, required String value}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: 90,
        child: Text(
          label,
          style: AppTypography.subhead().copyWith(
            color: AppColor.textSecondary,
          ),
        ),
      ),
      Text(
        ": ",
        style: AppTypography.subhead().copyWith(
          color: AppColor.textSecondary,
        ),
      ),
      Expanded(
        child: Text(
          value,
          style:
              AppTypography.subhead(fontWeight: AppTypography.medium).copyWith(
            color: AppColor.textPrimary,
          ),
        ),
      ),
    ],
  );
}

class EncryptionProgressBar extends StatelessWidget {
  final double progress;
  final bool isVisible;
  final String title;
  final String? description;

  const EncryptionProgressBar({
    super.key,
    required this.progress,
    required this.isVisible,
    this.title = 'Mengenkripsi Data',
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
                      const SizedBox(width: 14),
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
                            const SizedBox(height: 3),
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
                      const SizedBox(width: 12),
                      Text(
                        '$percentage%',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 10),
                  Text(
                    safeProgress >= 1
                        ? 'Enkripsi berhasil diselesaikan'
                        : 'Sedang memproses enkripsi...',
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
