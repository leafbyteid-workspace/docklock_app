import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../../../core/constants/app_color.dart';
import '../../../../../../../core/constants/app_typography.dart';
import '../../../../../../../core/helper/date_helper/format_date.dart';
import '../../../../../../../core/widget/action/app_button.dart';
import '../../../../../../../core/widget/input/app_textfield.dart';
import '../../../../../../../core/widget/navigation/app_appbar.dart';
import '../../../../../../data/services/PBE_encryption/enkripsi_metadata.dart';
import '../controllers/index_controller.dart';

class IndexBukaKunciBerkasView extends GetView<IndexBukaKunciBerkasController> {
  const IndexBukaKunciBerkasView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBarPengguna(
        title: "Buka Kunci Berkas",
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
                      Obx(
                        () => AppTextField(
                          type: AppTextFieldType.file,
                          label: "Berkas Terenkripsi",
                          hint: "Pilih Berkas .dclock",
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
                              _membuatKartuMetadata(metadata),
                              const SizedBox(height: 16),
                              _membuatKartuRingkasan(),
                              const SizedBox(height: 16),
                            ],
                          ),
                        );
                      }),
                      AppTextField(
                        controller: controller.kataSandiController,
                        label: "Kata Sandi",
                        hint: "Masukkan Kata Sandi...",
                        required: true,
                        type: AppTextFieldType.password,
                      ),
                      const SizedBox(height: 24),
                      Obx(
                        () => ProsesDekripsiBar(
                          isVisible: controller.isDecrypting.value,
                          progress: controller.proses.value,
                          title: "Membuka Kunci Berkas",
                          description: "Sedang melakukan proses dekripsi...",
                        ),
                      ),
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
                                result: result,
                                onOpen: controller.bukaBerkas,
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
                        ? "Sedang Membuka..."
                        : finished
                            ? "Buka Berkas Lain"
                            : "Buka Kunci Berkas",
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
  EnkripsiMetadataModel metadata,
) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColor.surface,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: AppColor.borderSubtle,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColor.overlay.withOpacity(.04),
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
                color: AppColor.primary.withOpacity(.08),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Symbols.description_rounded,
                color: AppColor.primary,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                "Informasi Berkas",
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
          "Nama Berkas",
          metadata.originalFileName,
        ),
        const SizedBox(height: 8),
        _buatMenuInformasi(
          "Deskripsi",
          metadata.description.isEmpty ? "-" : metadata.description,
        ),
        const SizedBox(height: 8),
        _buatMenuInformasi(
          "Petunjuk Sandi",
          metadata.hint.isEmpty ? "-" : metadata.hint,
        ),
        const SizedBox(height: 8),
        _buatMenuInformasi(
          "Dibuat Pada",
          formatDate(metadata.createdAt),
        ),
        const SizedBox(height: 8),
        _buatMenuInformasi(
          "Ukuran",
          metadata.readableSize,
        ),
        const SizedBox(height: 8),
        _buatMenuInformasi(
          "Tipe",
          metadata.mimeType,
        ),
        const SizedBox(height: 8),
        _buatMenuInformasi(
          "Enkstensi",
          metadata.originalExtension,
        ),
        const SizedBox(height: 8),
        _buatMenuInformasi(
          "Versi",
          metadata.formatVersion,
        ),
      ],
    ),
  );
}

Widget _membuatKartuRingkasan() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.green.shade50,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Symbols.shield,
          color: Colors.green,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            "Berkas ini menggunakan AES-256-GCM dengan PBKDF2. "
            "Integritas Berkas akan diverifikasi sebelum hasil dekripsi disimpan.",
            style: AppTypography.bodyPrimary(),
          ),
        ),
      ],
    ),
  );
}

Widget _membuatKartuHasilDekripsi({
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
      ),
      boxShadow: [
        BoxShadow(
          color: AppColor.overlay.withOpacity(.04),
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
                color: AppColor.success.withOpacity(.10),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Symbols.lock_open_rounded,
                color: AppColor.success,
                size: 22,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                "Berkas Berhasil Dibuka",
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
          "Nama Berkas",
          result.originalName,
        ),
        const SizedBox(height: 8),
        _buatMenuInformasi(
          "Sumber",
          result.encryptedName,
        ),
        const SizedBox(height: 8),
        _buatMenuInformasi(
          "Ukuran",
          result.size,
        ),
        const SizedBox(height: 8),
        _buatMenuInformasi(
          "Tanggal Dikunci",
          formatDate(
            result.encryptedAt,
          ),
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
                  Symbols.folder_open_rounded,
                  size: 18,
                ),
                label: const Text(
                  "Buka",
                  style: AppTypography.buttonSecondary,
                ),
              ),
            ),
            const SizedBox(width: 16),
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
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
                icon: const Icon(
                  Symbols.share_rounded,
                  size: 18,
                ),
                label: const Text(
                  "Bagikan",
                  style: AppTypography.buttonSecondary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
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
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
            ),
            icon: const Icon(
              Symbols.file_download_rounded,
            ),
            label: const Text(
              "Unduh Berkas",
              style: AppTypography.buttonPrimary,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buatMenuInformasi(
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
          style: AppTypography.subhead(
            fontWeight: AppTypography.medium,
          ).copyWith(
            color: AppColor.textPrimary,
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
        color: AppColor.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColor.borderSubtle,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: AppColor.primary.withOpacity(.08),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Symbols.lock_open_rounded,
              size: 34,
              color: AppColor.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Belum Ada Berkas",
            style: AppTypography.title3(
              fontWeight: AppTypography.semiBold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Silakan pilih Berkas .dclock terlebih dahulu untuk melihat informasi berkas dan melakukan proses dekripsi.",
            textAlign: TextAlign.center,
            style: AppTypography.bodyPrimary().copyWith(
              color: AppColor.textSecondary,
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
                        ? 'Dekripsi berhasil diselesaikan'
                        : 'Sedang memproses dekripsi...',
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
