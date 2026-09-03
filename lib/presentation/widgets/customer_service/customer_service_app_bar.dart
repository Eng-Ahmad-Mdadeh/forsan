import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';

class CustomerServiceAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomerServiceAppBar({required this.title, super.key});

  final String title;

  @override
  Size get preferredSize => Size.fromHeight(AppHeight.h60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: AppHeight.h60,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.backGround,
      surfaceTintColor: Colors.transparent,
      leadingWidth: AppWidth.w38 + (AppPaddingWidth.p13 * 2),
      leading: Padding(
        padding: EdgeInsetsDirectional.only(start: AppPaddingWidth.p13, end: AppPaddingWidth.p13),
        child: Center(
          child: SizedBox.square(
            dimension: AppWidth.w38,
            child: Material(
              color: Colors.transparent,
              shape: const CircleBorder(side: BorderSide(color: AppColors.primary)),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => Navigator.of(context).maybePop(),
                customBorder: const CircleBorder(),
                child: Icon(Icons.arrow_back_ios_new_outlined, size: AppSize.s19, color: AppColors.primary),
              ),
            ),
          ),
        ),
      ),
      titleSpacing: 0,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: AppFontFamily.rubik,
          fontSize: AppFontSize.s16,
          fontWeight: AppFontWeight.bold,
          color: AppColors.customerServiceMainText,
        ),
      ),
    );
  }
}
