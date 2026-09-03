import 'package:flutter/material.dart';
import 'package:tamalok/core/resources/app_assets.dart';
import 'package:tamalok/core/resources/app_values.dart';
import 'package:tamalok/presentation/widgets/image_view.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageView(
      imagePath: AppAssets.logo,
      fit: BoxFit.contain,
      height: AppHeight.h160,
    );
  }
}
