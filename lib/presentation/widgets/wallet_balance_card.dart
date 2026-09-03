import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart' show Iconsax;
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tamalok/core/resources/app_assets.dart';
import 'package:tamalok/core/resources/app_colors.dart';
import 'package:tamalok/core/resources/app_fonts.dart';
import 'package:tamalok/core/resources/app_values.dart';
import 'package:tamalok/presentation/widgets/image_view.dart';
import 'package:tamalok/presentation/widgets/text/body_title.dart';
import 'package:tamalok/presentation/widgets/text/section_title.dart';

class WalletBalanceCard extends StatelessWidget {
  const WalletBalanceCard({
    super.key,
    this.balance = '1,392,465',
    this.title = 'الرصيد المتوفر في المحفظة',
    this.actionText = 'اشحن المحفظة',
    this.onActionTap,
    this.showAction = true,
    this.showLogo = true,
    this.height,
    this.showBalanceSkeleton = false,
  });

  final String balance;
  final String title;
  final String actionText;
  final VoidCallback? onActionTap;
  final bool showAction;
  final bool showLogo;
  final double? height;
  final bool showBalanceSkeleton;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(AppRadius.r10);

    return Container(
      height: height ?? AppHeight.h155,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: const LinearGradient(
          begin: AlignmentDirectional.centerStart,
          end: AlignmentDirectional.centerEnd,
          colors: [AppColors.primary, AppColors.secondary],
        ),
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          children: [
            // PositionedDirectional(
            //   start: -AppWidth.w45,
            //   bottom: -AppHeight.h65,
            //   child: Container(
            //     width: AppWidth.w150,
            //     height: AppHeight.h150,
            //     decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.white.withOpacity(.08)),
            //   ),
            // ),
            PositionedDirectional(
              end: -AppWidth.w65,
              bottom: -AppHeight.h75,
              child: Container(
                width: AppWidth.w150,
                height: AppHeight.h150,
                decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.white.withOpacity(.08)),
              ),
            ),
            PositionedDirectional(
              end: AppWidth.w18,
              top: AppHeight.h14,
              child: Container(
                height: AppHeight.h50,
                width: AppWidth.w50,
                decoration: BoxDecoration(color: const Color(0x332F8C99), borderRadius: BorderRadius.circular(AppRadius.r10)),
                child: Icon(Iconsax.wallet_2_outline, color: AppColors.white, size: AppSize.s30),
              ),
            ),
            PositionedDirectional(
              start: AppWidth.w18,
              top: AppHeight.h15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(showLogo)...[
                  ImageView(
                    imagePath: AppAssets.logo,
                    fit: BoxFit.cover,
                    radius: BorderRadius.circular(AppRadius.r100),
                    width: AppWidth.w25,
                    height: AppHeight.h25,
                  ),
                  SizedBox(height: AppHeight.h20),
                  ],BodyTitle(
                    text: title,
                    color: AppColors.white,
                    fontSize: AppFontSize.s14,
                    fontWeight: AppFontWeight.regular,
                  ),
                  SizedBox(height: AppHeight.h7),
                  Row(
                    spacing: AppHeight.h6,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildBalanceText(),
                      ImageView(
                        imagePath: AppAssets.riyal,
                        width: AppWidth.w24,
                        height: AppHeight.h24,
                        color: AppColors.white,
                      ),

                    ],
                  ),
                ],
              ),
            ),
            // PositionedDirectional(
            //   start: AppWidth.w18,
            //   top: AppHeight.h60,
            //   child: BodyTitle(
            //     text: title,
            //     color: AppColors.white,
            //     fontSize: AppFontSize.s14,
            //     fontWeight: AppFontWeight.regular,
            //   ),
            // ),
            // PositionedDirectional(
            //   start: AppWidth.w18,
            //   top: AppHeight.h90,
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       ImageView(
            //         imagePath: AppAssets.riyal,
            //         width: AppWidth.w24,
            //         height: AppHeight.h24,
            //         color: AppColors.white,
            //       ),
            //       SizedBox(width: AppWidth.w6),
            //       SectionTitle(
            //         text: balance,
            //         color: AppColors.white,
            //         fontSize: AppFontSize.s32,
            //       ),
            //     ],
            //   ),
            // ),
            if (showAction)
              PositionedDirectional(
                end: AppWidth.w18,
                bottom: AppHeight.h25,
                child: InkWell(
                  onTap: onActionTap,
                  borderRadius: BorderRadius.circular(AppRadius.r9),
                  child: Container(
                    height: AppHeight.h38,
                    padding: EdgeInsets.symmetric(horizontal: AppPaddingWidth.p12),
                    decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(AppRadius.r9)),
                    child: Center(
                      child: BodyTitle(
                        text: actionText,
                        color: AppColors.primary,
                        fontSize: AppFontSize.s14,
                        fontWeight: AppFontWeight.regular,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceText() {
    final balanceText = SectionTitle(
      text: balance,
      color: AppColors.white,
      fontSize: AppFontSize.s32,
    );

    if (!showBalanceSkeleton) {
      return balanceText;
    }

    return Skeletonizer(
      enabled: true,
      enableSwitchAnimation: true,
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        begin: AlignmentDirectional.centerStart,
        end: AlignmentDirectional.centerEnd,
        duration: const Duration(milliseconds: 700),
      ),
      child: IgnorePointer(child: balanceText),
    );
  }
}
