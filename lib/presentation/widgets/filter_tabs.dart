import 'package:flutter/material.dart';
import 'package:tamalok/core/resources/app_colors.dart';
import 'package:tamalok/core/resources/app_fonts.dart';
import 'package:tamalok/core/resources/app_values.dart';
import 'package:tamalok/presentation/widgets/text/body_title.dart';

class FilterTabs extends StatelessWidget {
  const FilterTabs({
    super.key,
    required this.items,
    this.selectedIndex = 0,
    this.onSelected,
    this.unselectedTextColor = AppColors.secondary,
    this.fontWeight = AppFontWeight.bold,
  });

  final List<FilterTabItem> items;
  final int selectedIndex;
  final ValueChanged<int>? onSelected;
  final Color unselectedTextColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppHeight.h60,
      padding: EdgeInsetsDirectional.only(top: AppPaddingHeight.p6, bottom: AppPaddingHeight.p6),
      decoration: BoxDecoration(color: AppColors.greyButton, borderRadius: BorderRadius.circular(AppRadius.r14)),
      child: ListView.separated(
        padding: EdgeInsets.only(right: AppPaddingWidth.p7, left: AppPaddingWidth.p7),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, index) => SizedBox(width: AppWidth.w6),
        itemBuilder: (context, index) => _FilterTab(
          item: items[index],
          selected: index == selectedIndex,
          unselectedTextColor: unselectedTextColor,
          fontWeight: fontWeight,
          onTap: onSelected == null ? null : () => onSelected!(index),
        ),
      ),
    );
  }
}

/// The content displayed by a [FilterTabs] tab.
class FilterTabItem {
  const FilterTabItem({required this.label, this.icon});

  final String label;
  final IconData? icon;
}

class _FilterTab extends StatelessWidget {
  const _FilterTab({
    required this.item,
    required this.selected,
    required this.unselectedTextColor,
    required this.fontWeight,
    this.onTap,
  });

  final FilterTabItem item;
  final bool selected;
  final Color unselectedTextColor;
  final FontWeight fontWeight;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(AppRadius.r12);

    return Container(
      constraints: BoxConstraints(maxWidth: AppWidth.w200, minWidth: AppWidth.w115),
      height: AppHeight.h40,
      padding: EdgeInsetsDirectional.symmetric(horizontal: AppPaddingWidth.p13),
      decoration: BoxDecoration(color: selected ? AppColors.primary : AppColors.white, borderRadius: borderRadius),
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: AppWidth.w7,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (item.icon case final icon?)
                Icon(icon, size: AppSize.s20, color: selected ? AppColors.white : AppColors.grey),
              Flexible(
                child: BodyTitle(
                  text: item.label,
                  color: selected ? AppColors.white : unselectedTextColor,
                  fontSize: AppFontSize.s14,
                  fontWeight: fontWeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
