import 'package:tamalok/core/resources/app_assets.dart';
import 'package:tamalok/presentation/widgets/image_view.dart';
import 'package:flutter/material.dart';
import 'package:tamalok/core/extension/localization_extension.dart';
import 'package:tamalok/core/resources/app_colors.dart';
import 'package:tamalok/core/resources/app_fonts.dart';
import 'package:tamalok/core/resources/app_values.dart';
import 'package:tamalok/presentation/widgets/text/body_title.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  String? version;

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.loc;
    return Column(
      spacing: AppHeight.h13,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            launchUrl(Uri.parse("https://sta.sa/"));
          },
          child: ImageView(
            width: AppWidth.w100,
            height: AppHeight.h30,
            fit: BoxFit.cover,
            imagePath: AppAssets.webStarTech,
          ),
        ),
        BodyTitle(
          text: tr.app_version(version ?? ''),
          fontSize: AppFontSize.s12,
          fontWeight: AppFontWeight.medium,
          color: AppColors.greyText,
        ),
      ],
    );
  }
}
