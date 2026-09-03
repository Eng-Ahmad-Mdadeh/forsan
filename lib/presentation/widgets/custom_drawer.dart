import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/core/extension/localization_extension.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      clipBehavior: Clip.none,
      width: AppWidth.w290,
      backgroundColor: AppColors.backGround,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          // bottomLeft: Radius.circular(
          //   AppRadius.r100,
          // ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header (Admin Info)
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            decoration: const BoxDecoration(
              color: AppColors.lightPrimary,
              // borderRadius: BorderRadius.only(
              //   topRight: Radius.circular(AppRadius.r100),
              // ),
            ),
            accountName: Text(
              context.loc.admin_panel_title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            accountEmail: Text(context.loc.admin_panel_email),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.admin_panel_settings, color: Colors.teal),
            ),
          ),

          // Menu Items
          _buildDrawerItem(
            context,
            icon: Icons.group,
            title: context.loc.admin_panel_users,
            route: "/users",
          ),
          _buildDrawerItem(
            context,
            icon: Icons.people_outline,
            title: context.loc.admin_panel_groups,
            route: "/groups",
          ),
          _buildDrawerItem(
            context,
            icon: Icons.extension,
            title: context.loc.admin_panel_programs,
            route: "/programs",
          ),
          _buildDrawerItem(
            context,
            icon: Icons.school,
            title: context.loc.admin_panel_pro_programs,
            route: "/pro_programs",
          ),
          _buildDrawerItem(
            context,
            icon: Icons.event,
            title: context.loc.admin_panel_events,
            route: "/events",
          ),
          _buildDrawerItem(
            context,
            icon: Icons.schedule,
            title: context.loc.admin_panel_schedules,
            route: "/schedules",
          ),

          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String route,
  }) {
    return ListTile(
      contentPadding: EdgeInsetsDirectional.only(
        start: AppPaddingWidth.p15,
      ),
      leading: Icon(icon, color: Colors.teal),
      title: BodyTitle(
        text: title,
      ),
      onTap: () {
        context.go(route);
        Navigator.pop(context); // يغلق Drawer بعد التنقل
      },
    );
  }
}
