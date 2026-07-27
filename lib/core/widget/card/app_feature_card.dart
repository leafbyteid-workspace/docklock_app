import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../../constants/app_color.dart';
import '../../constants/app_typography.dart';

enum AppTataLetakKartuFitur {
  vertical,
  horizontal,
}

class AppFeatureCard extends StatelessWidget {
  final AppTataLetakKartuFitur layout;
  final String label;
  final String title;
  final String description;
  final String? backgroundImage;
  final String actionText;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final IconData backgroundIcon;
  final Color accentColor;

  const AppFeatureCard({
    this.layout = AppTataLetakKartuFitur.vertical,
    super.key,
    required this.label,
    required this.title,
    required this.description,
    this.backgroundImage,
    required this.backgroundIcon,
    this.actionText = 'Learn more',
    this.onTap,
    this.backgroundColor = const Color(0xFF2563EB),
    this.accentColor = const Color(0xFFF8FAFC),
  });

  @override
  Widget build(BuildContext context) {
    final bool isHorizontal = layout == AppTataLetakKartuFitur.horizontal;
    final double padding = isHorizontal ? 16 : 20;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(.08),
        ),
        image: backgroundImage != null
            ? DecorationImage(
                image: AssetImage(backgroundImage!),
                alignment: Alignment.bottomRight,
                fit: BoxFit.none,
                scale: isHorizontal ? 1.8 : 1.2,
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: AppColor.overlay.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            Positioned(
              right: isHorizontal ? -16 : -24,
              bottom: isHorizontal ? -16 : -24,
              child: IgnorePointer(
                child: Transform.rotate(
                  angle: -.3,
                  child: Icon(
                    backgroundIcon,
                    size: isHorizontal ? 130 : 190,
                    color: Colors.white.withOpacity(.08),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.14),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      label.toUpperCase(),
                      style: AppTypography.badge.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      title,
                      style: AppTypography.title2().copyWith(
                        color: AppColor.textInverse,
                        fontWeight: AppTypography.bold,
                      ),
                      maxLines: isHorizontal ? 1 : 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      description,
                      style: AppTypography.bodySmall().copyWith(
                        color: AppColor.textInverse.withOpacity(.82),
                        height: 1.4,
                      ),
                      maxLines: isHorizontal ? 2 : 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: onTap,
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                actionText,
                                style: AppTypography.subhead().copyWith(
                                  color: Colors.white,
                                  fontWeight: AppTypography.semiBold,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Symbols.arrow_forward_rounded,
                                size: 16,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Container(
                            height: 1.5,
                            width: isHorizontal ? 72 : 85,
                            color: AppColor.textInverse,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// White
// import 'package:flutter/material.dart';
// import 'package:material_symbols_icons/symbols.dart';
// import '../../constants/app_color.dart';
// import '../../constants/app_typography.dart';

// enum AppTataLetakKartuFitur {
//   vertical,
//   horizontal,
// }

// class AppFeatureCard extends StatelessWidget {
//   final AppTataLetakKartuFitur layout;
//   final String label;
//   final String title;
//   final String description;
//   final String? backgroundImage;
//   final String actionText;
//   final VoidCallback? onTap;
//   final Color backgroundColor;
//   final IconData backgroundIcon;
//   final Color accentColor;

//   const AppFeatureCard({
//     this.layout = AppTataLetakKartuFitur.vertical,
//     super.key,
//     required this.label,
//     required this.title,
//     required this.description,
//     this.backgroundImage,
//     required this.backgroundIcon,
//     this.actionText = 'Learn more',
//     this.onTap,
//     this.backgroundColor = const Color(0xFFF8FAFC),
//     this.accentColor = const Color(0xFF2563EB),
//   });

//   @override
//   Widget build(BuildContext context) {
//     final bool isHorizontal = layout == AppTataLetakKartuFitur.horizontal;
//     final double padding = isHorizontal ? 16 : 20;
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(
//           color: AppColor.borderSubtle,
//           width: 1,
//         ),
//         image: backgroundImage != null
//             ? DecorationImage(
//                 image: AssetImage(backgroundImage!),
//                 alignment: Alignment.bottomRight,
//                 fit: BoxFit.none,
//                 scale: isHorizontal ? 1.8 : 1.2,
//               )
//             : null,
//         boxShadow: [
//           BoxShadow(
//             color: AppColor.overlay.withOpacity(0.04),
//             blurRadius: 12,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16),
//         child: Stack(
//           children: [
//             Positioned(
//               right: isHorizontal ? -8 : -16,
//               bottom: isHorizontal ? -8 : -16,
//               child: IgnorePointer(
//                 child: Transform.rotate(
//                   angle: -0.25,
//                   child: Icon(
//                     backgroundIcon,
//                     size: isHorizontal ? 120 : 180,
//                     color: accentColor.withOpacity(0.10),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(padding),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 6,
//                     ),
//                     decoration: BoxDecoration(
//                       color: AppColor.surface,
//                       borderRadius: BorderRadius.circular(8),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.03),
//                           blurRadius: 4,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Text(
//                       label.toUpperCase(),
//                       style: AppTypography.badge.copyWith(
//                         color: accentColor.withOpacity(0.9),
//                         fontWeight: FontWeight.w700,
//                         letterSpacing: 1.1,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   SizedBox(
//                     width: double.infinity,
//                     child: Text(
//                       title,
//                       style: AppTypography.title2().copyWith(
//                         color: AppColor.textPrimary,
//                         fontWeight: AppTypography.bold,
//                       ),
//                       maxLines: isHorizontal ? 1 : 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   SizedBox(
//                     width: double.infinity,
//                     child: Text(
//                       description,
//                       style: AppTypography.bodySmall().copyWith(
//                         color: AppColor.textSecondary,
//                         height: 1.4,
//                       ),
//                       maxLines: isHorizontal ? 2 : 3,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   InkWell(
//                     onTap: onTap,
//                     borderRadius: BorderRadius.circular(4),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 2.0),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Text(
//                                 actionText,
//                                 style: AppTypography.subhead().copyWith(
//                                   fontSize: isHorizontal ? 13 : null,
//                                   color: AppColor.textPrimary,
//                                   fontWeight: AppTypography.semiBold,
//                                 ),
//                               ),
//                               const SizedBox(width: 4),
//                               const Icon(
//                                 Symbols.arrow_forward_rounded,
//                                 size: 16,
//                                 color: AppColor.textPrimary,
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 2),
//                           Container(
//                             height: 1.5,
//                             width: isHorizontal ? 72 : 85,
//                             color: AppColor.textPrimary,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
