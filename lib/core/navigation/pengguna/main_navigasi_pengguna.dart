import 'package:doclock_app/core/theme/app_theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../app/modules/pengguna/reguler/layar_utama/aktivitas/views/index_view.dart';
import '../../../app/modules/pengguna/reguler/layar_utama/beranda/views/index_view.dart';
import '../../../app/modules/pengguna/reguler/layar_utama/profil/views/index_view.dart';
import '../../../localization/locale_keys.dart';
import '../../constants/app_typography.dart';

class MainNavigasiPenggunaController extends GetxController {
  final selectedIndex = 1.obs;

  Future<void> changePage(int index) async {
    if (selectedIndex.value == index) return;

    selectedIndex.value = index;
  }
}

class MainNavigasiPenggunaView extends GetView<MainNavigasiPenggunaController> {
  const MainNavigasiPenggunaView({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      const IndexAktivitasView(),
      const IndexBerandaView(),
      const IndexProfilPenggunaView(),
    ];

    return Obx(
      () => Scaffold(
        backgroundColor: context.appTheme.background,
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: pages,
        ),
        bottomNavigationBar: _NavigasiBawahPenggunaMobile(
          selectedIndex: controller.selectedIndex.value,
          onChanged: controller.changePage,
        ),
      ),
    );
  }
}

class _NavigasiBawahPenggunaMobile extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const _NavigasiBawahPenggunaMobile({
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: SizedBox(
          height: 72,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeInCubic,
            child: CustomPaint(
              key: ValueKey<int>(selectedIndex),
              painter: _WarnaKurvaNavigasi(
                selectedIndex: selectedIndex,
                itemCount: 3,
                backgroundColor: context.appTheme.surface,
                shadowColor: context.appTheme.surfaceVariant.withOpacity(0.08),
                borderColor: context.appTheme.borderSubtle,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: _MenuNavigasi(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuNavigasi extends StatelessWidget {
  const _MenuNavigasi();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainNavigasiPenggunaController>();

    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: _TabNavigasi(
              label: LocaleKeys.activity.tr,
              icon: Symbols.history_rounded,
              selectedIcon: Symbols.history,
              selected: controller.selectedIndex.value == 0,
              onTap: () => controller.changePage(0),
            ),
          ),
          Expanded(
            child: _TabNavigasi(
              label: LocaleKeys.home.tr,
              icon: Symbols.home_rounded,
              selectedIcon: Symbols.home,
              selected: controller.selectedIndex.value == 1,
              onTap: () => controller.changePage(1),
            ),
          ),
          Expanded(
            child: _TabNavigasi(
              label: LocaleKeys.profile.tr,
              icon: Symbols.person_rounded,
              selectedIcon: Symbols.person,
              selected: controller.selectedIndex.value == 2,
              onTap: () => controller.changePage(2),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabNavigasi extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final bool selected;
  final VoidCallback onTap;

  const _TabNavigasi({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeOutBack,
            top: selected ? -16 : 8,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              width: selected ? 50 : 36,
              height: selected ? 50 : 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected ? context.appTheme.primary : Colors.transparent,
              ),
              child: Center(
                child: Icon(
                  selected ? selectedIcon : icon,
                  size: selected ? 24 : 22,
                  color: selected
                      ? context.appTheme.onPrimary
                      : context.appTheme.iconSecondary,
                  fill: selected ? 1.0 : 0.0,
                  weight: selected ? 600 : 400,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: selected ? 1.0 : 0.7,
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: AppTypography.caption1().copyWith(
                  color: selected
                      ? context.appTheme.primary
                      : context.appTheme.textSecondary,
                  fontWeight:
                      selected ? AppTypography.bold : AppTypography.medium,
                  fontSize: selected ? 11 : 10.5,
                  letterSpacing: selected ? -0.1 : 0,
                ),
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WarnaKurvaNavigasi extends CustomPainter {
  final int selectedIndex;
  final int itemCount;
  final Color backgroundColor;
  final Color shadowColor;
  final Color borderColor;

  _WarnaKurvaNavigasi({
    required this.selectedIndex,
    required this.itemCount,
    required this.backgroundColor,
    required this.shadowColor,
    required this.borderColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final shadowPaint = Paint()
      ..color = shadowColor
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 16);

    final itemWidth = size.width / itemCount;
    final centerPos = (itemWidth * selectedIndex) + (itemWidth / 2);

    const cornerRadius = 24.0;
    const notchWidth = 64.0;
    const notchHeight = 20.0;

    final path = Path()
      ..moveTo(cornerRadius, 0)
      ..lineTo(centerPos - notchWidth / 2, 0)
      ..cubicTo(
        centerPos - notchWidth / 3.8,
        0,
        centerPos - notchWidth / 3.8,
        notchHeight,
        centerPos,
        notchHeight,
      )
      ..cubicTo(
        centerPos + notchWidth / 3.8,
        notchHeight,
        centerPos + notchWidth / 3.8,
        0,
        centerPos + notchWidth / 2,
        0,
      )
      ..lineTo(size.width - cornerRadius, 0)
      ..quadraticBezierTo(size.width, 0, size.width, cornerRadius)
      ..lineTo(size.width, size.height - cornerRadius)
      ..quadraticBezierTo(
          size.width, size.height, size.width - cornerRadius, size.height)
      ..lineTo(cornerRadius, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - cornerRadius)
      ..lineTo(0, cornerRadius)
      ..quadraticBezierTo(0, 0, cornerRadius, 0)
      ..close();

    canvas.drawPath(path.shift(const Offset(0, 8)), shadowPaint);
    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant _WarnaKurvaNavigasi oldDelegate) {
    return oldDelegate.selectedIndex != selectedIndex ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.shadowColor != shadowColor ||
        oldDelegate.borderColor != borderColor;
  }
}
