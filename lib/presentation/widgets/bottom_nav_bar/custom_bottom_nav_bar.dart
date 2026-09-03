import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/routes/app_routes.dart';
import 'package:forsan/presentation/cubit/bottom_bar/bottom_bar_cubit.dart';
import 'package:forsan/presentation/widgets/bottom_nav_bar/bottom_nav_destination.dart';
import 'package:forsan/presentation/widgets/bottom_nav_bar/custom_nav_item.dart';
import 'package:forsan/presentation/widgets/bottom_nav_bar/primary_nav_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  static const List<BottomNavDestination> _destinations = <BottomNavDestination>[
    BottomNavDestination(label: 'الفرص', icon: Iconsax.home_2_outline),
    BottomNavDestination(label: 'المفضلة', icon: Icons.favorite_border_rounded),
    BottomNavDestination(label: 'إضافة عقار', icon: Icons.add_home_work_outlined, isPrimary: true),
    BottomNavDestination(label: 'عقاراتي', icon: Iconsax.buliding_outline),
    BottomNavDestination(label: 'المزيد', icon: Icons.more_horiz),
  ];

  int get _selectedDestinationIndex =>
      navigationShell.currentIndex < 2 ? navigationShell.currentIndex : navigationShell.currentIndex + 1;

  void _selectDestination(BuildContext context, int index) {
    if (_destinations[index].isPrimary) {
      const AddPropertyRoute().go(context);
      return;
    }

    final branchIndex = index < 2 ? index : index - 1;
    navigationShell.goBranch(branchIndex, initialLocation: branchIndex == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final isVisible = context.watch<BottomBarCubit>().state;

    return AnimatedSize(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOutCubic,
      alignment: Alignment.bottomCenter,
      child: isVisible
          ? SafeArea(
              top: false,
              child: Container(
                padding: EdgeInsetsDirectional.symmetric(horizontal: AppPaddingWidth.p8),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  boxShadow: <BoxShadow>[BoxShadow(color: Color(0x14000000), offset: Offset(0, -2), blurRadius: 14)],
                ),
                child: SizedBox(
                  height: 80,
                  child: Stack(
                    children: <Widget>[
                      const PositionedDirectional(
                        top: 0,
                        start: 0,
                        end: 0,
                        child: Divider(height: 1, thickness: 1, color: Color(0xFFF0EEF3)),
                      ),
                      Padding(
                        padding: EdgeInsets.zero,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: List<Widget>.generate(_destinations.length, (index) {
                            final destination = _destinations[index];
                            final isSelected = _selectedDestinationIndex == index;
                            final item = destination.isPrimary
                                ? PrimaryNavItem(
                                    label: destination.label,
                                    selected: isSelected,
                                    onPressed: () => _selectDestination(context, index),
                                  )
                                : CustomNavItem(
                                    label: destination.label,
                                    icon: destination.icon,
                                    selected: isSelected,
                                    onPressed: () => _selectDestination(context, index),
                                  );

                            return Expanded(child: item);
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
