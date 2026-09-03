import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_values.dart';
import '../image_view.dart';
import '../text/section_title.dart';

class DocumentUploadPlaceholder extends StatelessWidget {
  final String? image;
  final bool isExpanded;
  final bool isVideo;
  final VoidCallback? onRemove;

  const DocumentUploadPlaceholder({
    super.key,
    required this.image,
    required this.isExpanded,
    this.isVideo = false,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      alignment: Alignment.center,
      height: isExpanded ? AppHeight.h250 : AppHeight.h150,
      width: double.infinity,
      child: image != null
          ? Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: AppPaddingHeight.p13),
                  child: ImageView(
                    imagePath: image!,
                    height: isExpanded ? AppHeight.h210 : AppHeight.h110,
                    width: double.infinity,
                    radius: BorderRadius.circular(AppRadius.r15),
                    fit: isExpanded ? BoxFit.cover : BoxFit.fitWidth,
                  ),
                ),
                if (onRemove != null)
                  Positioned(
                    top: AppPaddingHeight.p6,
                    right: AppPaddingWidth.p6,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Iconsax.close_circle_outline,
                        color: AppColors.red,
                      ),
                      onPressed: onRemove,
                    ),
                  ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isVideo ? Iconsax.video_vertical_outline : Iconsax.camera_outline,
                  color: AppColors.grey,
                  size: AppSize.s42,
                ),
                SizedBox(height: AppHeight.h7),
                SectionTitle(
                  text: isVideo ? "أضف فيديو" : "أضف صورة",
                  color: AppColors.greyText,
                ),
                SizedBox(height: AppHeight.h18),
              ],
            ),
    );
  }
}
