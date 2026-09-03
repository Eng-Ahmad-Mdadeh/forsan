import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';

class CustomerServiceContactButton extends StatelessWidget {
  const CustomerServiceContactButton({required this.label, required this.onPressed, required this.width, super.key});

  final String label;
  final VoidCallback? onPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: AppHeight.h50,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.primary,
          disabledBackgroundColor: AppColors.primary,
          disabledForegroundColor: AppColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.r15)),
          elevation: 0,
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: AppFontFamily.rubik,
            fontSize: AppFontSize.s16,
            fontWeight: AppFontWeight.bold,
          ),
        ),
      ),
    );
  }
}
