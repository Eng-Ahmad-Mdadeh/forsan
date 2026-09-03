import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forsan/core/resources/app_assets.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_elevated_button.dart';
import 'package:forsan/presentation/widgets/image_view.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
import 'package:animations/animations.dart';

class VerificationSuccessDialog extends StatelessWidget {
  const VerificationSuccessDialog({
    super.key,
    this.title = 'تم التحقق بنجاح',
    this.message = 'يمكنك الآن البدء بتصفح الفرص العقارية',
    this.buttonText = 'متابعة',
    this.secondaryButtonText,
    this.amountText,
    this.messageFontSize,
    this.showRiyalWithAmount = false,
    this.onContinue,
    this.onSecondary,
    this.canDismiss = true,
    this.badgeIcon = Icons.check_rounded,
  });

  final String title;
  final String message;
  final String? buttonText;
  final String? secondaryButtonText;
  final String? amountText;
  final double? messageFontSize;
  final bool showRiyalWithAmount;
  final VoidCallback? onContinue;
  final VoidCallback? onSecondary;
  final bool canDismiss;
  final IconData badgeIcon;

  static Future<void> show(
    BuildContext context, {
    String title = 'تم التحقق بنجاح',
    String message = 'يمكنك الآن البدء بتصفح الفرص العقارية',
    String? buttonText = 'متابعة',
    String? secondaryButtonText,
    String? amountText,
    double? messageFontSize,
    bool showRiyalWithAmount = false,
    VoidCallback? onContinue,
    VoidCallback? onSecondary,
    bool canDismiss = true,
    IconData badgeIcon = Icons.check_rounded,
  }) {
    final disableAnimations = MediaQuery.disableAnimationsOf(context);

    return showGeneralDialog<void>(
      context: context,
      barrierDismissible: canDismiss,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withValues(alpha: .48),
      transitionDuration: disableAnimations ? Duration.zero : const Duration(milliseconds: 420),
      pageBuilder: (context, animation, secondaryAnimation) => VerificationSuccessDialog(
        title: title,
        message: message,
        buttonText: buttonText,
        secondaryButtonText: secondaryButtonText,
        amountText: amountText,
        messageFontSize: messageFontSize,
        showRiyalWithAmount: showRiyalWithAmount,
        onContinue: onContinue,
        onSecondary: onSecondary,
        canDismiss: canDismiss,
        badgeIcon: badgeIcon,
      ),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        if (disableAnimations) return child;

        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        );
        final curvedSecondaryAnimation = CurvedAnimation(
          parent: secondaryAnimation,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        );

        return SharedAxisTransition(
          animation: curvedAnimation,
          secondaryAnimation: curvedSecondaryAnimation,
          transitionType: SharedAxisTransitionType.scaled,
          fillColor: Colors.transparent,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canDismiss,
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(maxWidth: 520.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(28.r),
            boxShadow: const [BoxShadow(color: Color(0x24000000), blurRadius: 32, offset: Offset(0, 14))],
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(28.w, 36.h, 28.w, 28.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _SuccessBadge(icon: badgeIcon),
                    if (title.trim().isNotEmpty) ...[
                      SizedBox(height: 24.h),
                      SectionTitle(
                        text: title,
                        textAlign: TextAlign.center,
                        fontSize: AppFontSize.s22,
                        fontWeight: AppFontWeight.bold,
                        overflow: TextOverflow.visible,
                      ),
                    ],
                    if (message.trim().isNotEmpty) ...[
                      SizedBox(height: 8.h),
                      BodyTitle(
                        text: message,
                        textAlign: TextAlign.center,
                        color: AppColors.greyText,
                        fontSize: messageFontSize ?? AppFontSize.s16,
                        fontWeight: AppFontWeight.regular,
                        overflow: TextOverflow.visible,
                        maxLines: 3,
                      ),
                    ],
                    if (amountText != null) ...[
                      SizedBox(height: 8.h),
                      _DialogAmount(amountText: amountText!, showRiyal: showRiyalWithAmount),
                    ],
                    if (buttonText != null) ...[
                      SizedBox(height: 28.h),
                      _DialogActionButton(text: buttonText!, onPressed: () => _handleAction(context, onContinue)),
                    ],
                    if (secondaryButtonText != null) ...[
                      SizedBox(height: 10.h),
                      _DialogActionButton(
                        text: secondaryButtonText!,
                        isOutlined: true,
                        onPressed: () => _handleAction(context, onSecondary),
                      ),
                    ],
                  ],
                ),
              ),
              if (canDismiss)
                PositionedDirectional(
                  top: 22.h,
                  end: 22.w,
                  child: _CloseButton(onPressed: () => Navigator.of(context).pop()),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleAction(BuildContext context, VoidCallback? action) {
    if (action != null) {
      action();
      return;
    }
    Navigator.of(context).pop();
  }
}

class _DialogAmount extends StatelessWidget {
  const _DialogAmount({required this.amountText, required this.showRiyal});

  final String amountText;
  final bool showRiyal;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    textDirection: TextDirection.ltr,
    children: [
      if (showRiyal) ...[
        ImageView(imagePath: AppAssets.riyal, width: AppWidth.w11, height: AppHeight.h11, color: AppColors.green),
        SizedBox(width: AppWidth.w3),
      ],
      BodyTitle(
        text: amountText,
        textAlign: TextAlign.center,
        color: AppColors.green,
        fontSize: AppFontSize.s14,
        fontWeight: AppFontWeight.bold,
        overflow: TextOverflow.visible,
      ),
    ],
  );
}

class _CloseButton extends StatelessWidget {
  const _CloseButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => SizedBox.square(
    dimension: 38.w,
    child: Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: Icon(Icons.close_rounded, color: AppColors.primary, size: 28.sp),
      ),
    ),
  );
}

class _DialogActionButton extends StatelessWidget {
  const _DialogActionButton({required this.text, required this.onPressed, this.isOutlined = false});

  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) => CustomElevatedButton(
    height: 54.h,
    width: double.infinity,
    elevation: isOutlined ? 0 : 3,
    borderRadius: 10.r,
    color: isOutlined ? AppColors.white : AppColors.primary,
    borderSide: isOutlined ? const BorderSide(color: AppColors.primary) : null,
    onPressed: onPressed,
    child: SectionTitle(
      text: text,
      textAlign: TextAlign.center,
      color: isOutlined ? AppColors.primary : AppColors.white,
      fontSize: AppFontSize.s16,
      fontWeight: AppFontWeight.medium,
    ),
  );
}

class _SuccessBadge extends StatelessWidget {
  const _SuccessBadge({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 184.w,
    height: 174.w,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 150.w,
          height: 150.w,
          decoration: const BoxDecoration(color: Color(0xFFE8E1F7), shape: BoxShape.circle),
        ),
        Container(
          width: 104.w,
          height: 104.w,
          decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
          child: Icon(icon, color: AppColors.white, size: 61.sp),
        ),
        const Positioned(top: 0, right: 25, child: _ConfettiDot(size: 14, color: Color(0xFFFFC99E))),
        const Positioned(top: 23, left: 18, child: _ConfettiDot(size: 13, color: Color(0xFFA796D1))),
        const Positioned(top: 52, right: 0, child: _ConfettiDot(size: 17, color: Color(0xFFA796D1))),
        const Positioned(bottom: 22, right: 12, child: _ConfettiDot(size: 25, color: Color(0xFFFFC99E))),
        const Positioned(bottom: 32, left: 4, child: _ConfettiDot(size: 8, color: Color(0xFFA796D1))),
        const Positioned(top: 72, left: 0, child: _ConfettiDot(size: 25, color: Color(0xFFFFC99E))),
      ],
    ),
  );
}

class _ConfettiDot extends StatelessWidget {
  const _ConfettiDot({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    width: size.w,
    height: size.w,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  );
}
