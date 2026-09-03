import 'package:flutter/material.dart';
import 'package:tamalok/core/resources/app_colors.dart';
import 'package:tamalok/core/resources/app_fonts.dart';
import 'package:tamalok/core/resources/app_values.dart';
import 'package:tamalok/presentation/widgets/text/body_title.dart';

class FileUploadButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double? marginTop;
  final bool isLoading;

  const FileUploadButton({
    super.key,
    required this.title,
    required this.onTap,
    this.marginTop,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsetsDirectional.only(
          top: marginTop ?? AppMarginHeight.m17,
        ),
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isLoading
              ? AppColors.black.withAlpha(20)
              : AppColors.backGround,
          borderRadius: BorderRadius.circular(AppRadius.r7),
          border: Border.all(color: AppColors.lightPrimary),
        ),
        child: Column(
          children: [
            const Icon(Icons.upload_file, size: 40, color: AppColors.primary),
            const SizedBox(height: 8),
            BodyTitle(text: title, color: AppColors.primary),
            const SizedBox(height: 4),
            BodyTitle(
              text: "الحجم المسموح به حتى 5 ميغا بايت",
              fontSize: AppFontSize.s12,
              color: AppColors.greyText,
            ),
          ],
        ),
      ),
    );
  }
}
