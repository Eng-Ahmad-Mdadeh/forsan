import 'package:flutter/material.dart';
import 'package:tamalok/core/resources/app_colors.dart';
import 'package:tamalok/core/resources/app_fonts.dart';
import 'package:tamalok/core/resources/app_values.dart';
import 'package:tamalok/presentation/widgets/text/body_title.dart';
import 'package:tamalok/presentation/widgets/text/section_title.dart';

class CoverageProgress extends StatelessWidget {
  const CoverageProgress({required this.value, super.key, this.isOwnership = false});

  final num value;
  final bool isOwnership;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppHeight.h7,
      children: [
        Row(
          children: [
            BodyTitle(
              text: isOwnership ? 'نسبة التملك' : 'نسبة التغطية',
              fontSize: AppFontSize.s14,
              fontWeight: AppFontWeight.regular,
            ),
            const Spacer(),
            SectionTitle(text: '$value %', fontSize: AppFontSize.s16),
          ],
        ),
        Container(
          height: AppHeight.h13,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: AppColors.lightGrey, borderRadius: BorderRadius.circular(AppRadius.r20)),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.r20),
              child: FractionallySizedBox(
                widthFactor: value / 100,
                alignment: AlignmentDirectional.centerStart,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.centerStart,
                      end: AlignmentDirectional.centerEnd,
                      colors: [AppColors.primary, AppColors.secondary],
                    ),
                  ),
                  child: SizedBox.expand(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
