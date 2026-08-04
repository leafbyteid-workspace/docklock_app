import 'package:doclock_app/core/theme/app_theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../../../core/constants/app_typography.dart';
import '../../../../../../../core/errors/app_empty_state.dart';
import '../../../../../../../core/helper/date_helper/format_date.dart';
import '../../../../../../../core/utils/responsive_device/responsive_service.dart';
import '../../../../../../../core/widget/action/app_button.dart';
import '../../../../../../../core/widget/navigation/app_appbar.dart';
import '../../../../../../../localization/locale_keys.dart';
import '../../../../../../data/local/isar/models/berkas_model.dart';
import '../controllers/detail_berkas_controller.dart';

class DetailBerkasView extends GetView<DetailBerkasController> {
  const DetailBerkasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.background,
      appBar: AppBarPengguna(
        title: LocaleKeys.fileDetail.tr,
        onBackPressed: Get.back,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: LoadingAnimationWidget.inkDrop(
              color: context.appTheme.primary,
              size: Responsive.loadingSize(context),
            ),
          );
        }
        final data = controller.berkas.value;

        if (data == null) {
          return Center(
            child: EmptyState(
              icon: Symbols.history,
              title: LocaleKeys.dataNotFound.tr,
              subtitle: LocaleKeys.dataNotFoundDesc.tr,
            ),
          );
        }

        return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: Responsive.pageWidth(context),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: Responsive.horizontalPadding(context),
                        vertical: Responsive.sectionSpacing(context),
                      ),
                      child: Column(
                        children: [
                          _StatusCard(
                            status: data.statusBerkas,
                          ),
                          const SizedBox(height: 20),
                          _InfoCard(
                            title: LocaleKeys.fileInformation.tr,
                            children: [
                              _InfoItem(
                                LocaleKeys.originalName.tr,
                                controller.namaFile,
                              ),
                              _InfoItem(
                                LocaleKeys.encryptedName.tr,
                                controller.namaEnkripsi,
                              ),
                              _InfoItem(
                                LocaleKeys.fileSize.tr,
                                controller.ukuran,
                              ),
                              _InfoItem(
                                LocaleKeys.extension.tr,
                                controller.ekstensi,
                              ),
                              _InfoItem(
                                LocaleKeys.status.tr,
                                controller.status,
                              ),
                              _InfoItem(
                                LocaleKeys.lockedAt.tr,
                                controller.waktuTerkunci == null
                                    ? "-"
                                    : formatTanggal(
                                        controller.waktuTerkunci!,
                                      ),
                              ),
                              _InfoItem(
                                LocaleKeys.openedAt.tr,
                                controller.waktuTerbuka == null
                                    ? "-"
                                    : formatTanggal(
                                        controller.waktuTerbuka!,
                                      ),
                                isLast: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SafeArea(
                top: false,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                  decoration: BoxDecoration(
                    color: context.appTheme.surface,
                    border: Border(
                      top: BorderSide(
                        color: context.appTheme.borderSubtle,
                        width: 1,
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: context.appTheme.overlay.withOpacity(0.03),
                        blurRadius: 12,
                        offset: const Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Responsive.useCompactLayout(context)
                          ? Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: AppButton(
                                    text: LocaleKeys.share.tr,
                                    type: AppTipeTombol.secondary,
                                    icon: Symbols.share_rounded,
                                    onPressed: controller.bagikanBerkas,
                                  ),
                                ),
                                SizedBox(
                                  height: Responsive.textFieldSpacing(context),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: AppButton(
                                    text: LocaleKeys.download.tr,
                                    type: AppTipeTombol.primary,
                                    icon: Symbols.download_rounded,
                                    onPressed: controller.unduhBerkas,
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                Expanded(
                                  child: AppButton(
                                    text: LocaleKeys.share.tr,
                                    type: AppTipeTombol.secondary,
                                    icon: Symbols.share_rounded,
                                    onPressed: controller.bagikanBerkas,
                                  ),
                                ),
                                SizedBox(
                                  width: Responsive.textFieldSpacing(context),
                                ),
                                Expanded(
                                  child: AppButton(
                                    text: LocaleKeys.download.tr,
                                    type: AppTipeTombol.primary,
                                    icon: Symbols.download_rounded,
                                    onPressed: controller.unduhBerkas,
                                  ),
                                ),
                              ],
                            ),
                      SizedBox(
                        height: Responsive.textFieldSpacing(context),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Obx(
                          () => AppButton(
                            text: controller.isDeleting.value
                                ? LocaleKeys.deleting.tr
                                : LocaleKeys.deleteFile.tr,
                            type: AppTipeTombol.danger,
                            icon: Icons.delete_outline_rounded,
                            onPressed: controller.isDeleting.value
                                ? null
                                : controller.hapusBerkas,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _StatusCard extends StatelessWidget {
  final StatusBerkas status;

  const _StatusCard({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final terkunci = status == StatusBerkas.terkunci;
    final statusColor =
        terkunci ? context.appTheme.success : context.appTheme.warning;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: statusColor.withOpacity(0.18),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              terkunci ? Symbols.lock_rounded : Symbols.lock_open_rounded,
              color: statusColor,
              size: 32,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            terkunci ? LocaleKeys.fileLocked.tr : LocaleKeys.fileUnlocked.tr,
            style: AppTypography.title2(
              fontWeight: AppTypography.bold,
            ).copyWith(
              color: context.appTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              terkunci
                  ? LocaleKeys.fileLockedDesc.tr
                  : LocaleKeys.fileUnlockedDesc.tr,
              textAlign: TextAlign.center,
              style: AppTypography.bodySmall(
                fontWeight: AppTypography.regular,
              ).copyWith(
                color: context.appTheme.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _InfoCard({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.appTheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: context.appTheme.borderSubtle,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: context.appTheme.overlay.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 18,
                decoration: BoxDecoration(
                  color: context.appTheme.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: AppTypography.title3(
                  fontWeight: AppTypography.bold,
                ).copyWith(
                  color: context.appTheme.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...children,
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String title;
  final String value;
  final bool isLast;

  const _InfoItem(
    this.title,
    this.value, {
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
      margin: EdgeInsets.only(bottom: isLast ? 0 : 12),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(
                bottom: BorderSide(
                  color: context.appTheme.borderSubtle,
                  width: 0.8,
                ),
              ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 125,
            child: Text(
              title,
              style: AppTypography.subhead().copyWith(
                color: context.appTheme.textSecondary,
              ),
            ),
          ),
          Text(
            ": ",
            style: AppTypography.subhead().copyWith(
              color: context.appTheme.textTertiary,
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
      ),
    );
  }
}
