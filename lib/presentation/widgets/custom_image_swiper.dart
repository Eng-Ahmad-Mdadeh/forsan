import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../core/resources/app_colors.dart';
import '../../core/resources/app_values.dart';
import 'image_view.dart';

class CustomImageSwiper extends StatelessWidget {
  final List<String> imageUrls;
  final double width;
  final double height;
  final BorderRadius? radius;
  final bool showControllerSwiper;
  final bool loop;
  final BoxFit fit;
  final Color activePaginationColor;
  final Color inactivePaginationColor;
  final double? paginationBottomPadding;
  final void Function(int)? onIndexChanged;

  const CustomImageSwiper({
    super.key,
    required this.imageUrls,
    required this.width,
    required this.height,
    this.onIndexChanged,
    this.radius,
    this.showControllerSwiper = true,
    this.loop = false,
    this.fit = BoxFit.fill,
    this.activePaginationColor = Colors.white,
    this.inactivePaginationColor = const Color(0xCCFFFFFF),
    this.paginationBottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Swiper(
      loop: loop,
      itemCount: imageUrls.length,
      curve: Curves.fastOutSlowIn,
      control: showControllerSwiper ? const SwiperControl(color: AppColors.lightGrey) : null,
      pagination: SwiperCustomPagination(
        builder: (BuildContext context, SwiperPluginConfig config) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(config.itemCount, (int index) {
                final active = index == config.activeIndex;
                return Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: AppPaddingWidth.p4,
                  ),
                  child: Container(
                    width: AppWidth.w7, // Dot width
                    height: AppHeight.h7, // Dot height
                    margin: EdgeInsetsDirectional.only(
                      bottom: paginationBottomPadding ?? AppPaddingHeight.p15,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: active ? activePaginationColor : inactivePaginationColor,
                    ),
                  ),
                );
              }),
            ),
          );
        },
      ),
      onIndexChanged: onIndexChanged,
      itemBuilder: (BuildContext context, int index) {
        return ImageView(
          // imagePath: imageUrls[index].url!,
          imagePath: imageUrls[index],
          height: height,
          width: width,
          fit: fit,
          radius: radius,
        );
      },
    );
  }
}
