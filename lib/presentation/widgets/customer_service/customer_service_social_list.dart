import 'package:flutter/material.dart';
import 'package:tamalok/core/resources/app_values.dart';

class CustomerServiceSocialList extends StatelessWidget {
  const CustomerServiceSocialList({required this.items, super.key});

  final List<CustomerServiceSocialButton> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppHeight.h60,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: MediaQuery.sizeOf(context).width - AppWidth.w30),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var index = 0; index < items.length; index++) ...[
                items[index],
                if (index != items.length - 1) SizedBox(width: AppWidth.w20),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class CustomerServiceSocialButton extends StatelessWidget {
  const CustomerServiceSocialButton({required this.image, this.onTap, super.key});

  final ImageProvider image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(AppRadius.r30),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.r30),
        child: SizedBox.square(
          dimension: AppWidth.w45,
          child: Image(image: image, fit: BoxFit.contain, errorBuilder: (_, _, _) => const SizedBox.shrink()),
        ),
      ),
    );
  }
}
