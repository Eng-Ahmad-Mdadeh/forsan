import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';

class PrimaryNavItem extends StatelessWidget {
  const PrimaryNavItem({
    required this.label,
    required this.selected,
    required this.onPressed,
    super.key,
  });

  final String label;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: Align(
        alignment: AlignmentDirectional(0, -6.5),
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(end: selected ? 1 : 0),
            duration: const Duration(milliseconds: 420),
            curve: Curves.easeOutBack,
            builder: (context, progress, child) => Transform.scale(
              scale: 1 + (.06 * progress),
              child: Material(
                color: Color.lerp(AppColors.primary, AppColors.primaryActive, progress),
                borderRadius: BorderRadius.circular(AppRadius.r100),
                elevation: 0,
                child: InkWell(
                  onTap: onPressed,
                  borderRadius: BorderRadius.circular(AppRadius.r100),
                  child: SizedBox.square(
                    dimension: 62,
                    child: Transform.rotate(
                      angle: progress * .12,
                      child: const Icon(Icons.add_rounded, color: AppColors.white, size: 34),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
