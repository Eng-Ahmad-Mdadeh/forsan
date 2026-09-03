import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';

class CustomNavItem extends StatelessWidget {
  const CustomNavItem({
    required this.onPressed,
    required this.label,
    required this.selected,
    required this.icon,
    super.key,
  });

  final VoidCallback onPressed;
  final String label;
  final IconData icon;
  final bool selected;

  static const Color _inactiveColor = Color(0xFF303030);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: InkResponse(
        onTap: onPressed,
        containedInkWell: true,
        highlightShape: BoxShape.rectangle,
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(end: selected ? 1 : 0),
          duration: const Duration(milliseconds: 360),
          curve: Curves.easeOutBack,
          builder: (context, progress, child) {
            final color = Color.lerp(_inactiveColor, AppColors.primary, progress)!;

            return Transform.translate(
              offset: Offset(0, -2 * progress),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(minWidth: 56),
                  padding: const EdgeInsets.fromLTRB(7, 7, 7, 6),
                  decoration: BoxDecoration(
                    color: AppColors.light.withValues(alpha: .62 * progress),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Transform.scale(
                        scale: 1 + (.08 * progress),
                        child: Icon(icon, color: color, size: 25),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        label,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        style: TextStyle(
                          color: color,
                          fontSize: 12,
                          fontWeight: selected ? FontWeight.w500 : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
