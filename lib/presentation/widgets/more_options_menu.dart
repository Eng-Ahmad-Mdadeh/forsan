import 'package:icons_plus/icons_plus.dart';
import 'package:tamalok/core/resources/app_fonts.dart';
import 'package:tamalok/core/routes/app_routes_imports.dart';
import 'package:tamalok/presentation/widgets/text/body_title.dart';

class MoreOptionsMenu extends StatelessWidget {
  final VoidCallback? onEdit;
  final VoidCallback? onShow;
  final VoidCallback? onDelete;
  final VoidCallback? onCompletionProperty;

  const MoreOptionsMenu({
    super.key,
    required this.onEdit,
    required this.onShow,
    required this.onDelete,
    this.onCompletionProperty,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey iconKey = GlobalKey();

    return InkWell(
      splashColor: AppColors.none,
      highlightColor: AppColors.none,
      key: iconKey,
      onTap: () {
        final RenderBox renderBox = iconKey.currentContext!.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero);

        showMenu<String>(
          color: AppColors.white,
          context: context,
          position: RelativeRect.fromDirectional(
            textDirection: TextDirection.rtl,
            end: position.dx,
            top: position.dy + renderBox.size.height,
            start: position.dx + renderBox.size.width,
            bottom: 0,
          ),
          items: [
            if (onEdit != null)
              PopupMenuItem<String>(
                value: 'edit',
                child: InkWell(
                  onTap: () {
                    context.pop();
                    onEdit!();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Iconsax.edit_outline,
                        color: AppColors.secondary,
                        size: AppSize.s25,
                      ),
                      SizedBox(width: AppWidth.w8),
                      BodyTitle(
                        text: "تعديل",
                        color: AppColors.secondary,
                        fontSize: AppFontSize.s13,
                      ),
                    ],
                  ),
                ),
              ),
            if (onShow != null)
              PopupMenuItem<String>(
                value: 'show',
                child: InkWell(
                  onTap: () {
                    context.pop();
                    onShow!();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Iconsax.eye_outline,
                        color: AppColors.green,
                        size: AppSize.s25,
                      ),
                      SizedBox(width: AppWidth.w8),
                      BodyTitle(
                        text: "عرض",
                        color: AppColors.green,
                        fontSize: AppFontSize.s13,
                      ),
                    ],
                  ),
                ),
              ),
            if (onCompletionProperty != null)
              PopupMenuItem<String>(
                value: 'completion',
                child: InkWell(
                  onTap: () {
                    context.pop();
                    onCompletionProperty!();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.incomplete_circle,
                        color: AppColors.green,
                        size: AppSize.s25,
                      ),
                      SizedBox(width: AppWidth.w8),
                      BodyTitle(
                        text: "إستكمال",
                        color: AppColors.green,
                        fontSize: AppFontSize.s13,
                      ),
                    ],
                  ),
                ),
              ),
            if (onDelete != null)
              PopupMenuItem<String>(
                value: 'delete',
                child: InkWell(
                  onTap: () {
                    context.pop();
                    onDelete!();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Iconsax.trush_square_outline,
                        color: AppColors.red,
                        size: AppSize.s25,
                      ),
                      SizedBox(width: AppWidth.w8),
                      BodyTitle(
                        text: "حذف",
                        color: AppColors.red,
                        fontSize: AppFontSize.s13,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
      child: const Icon(
        Icons.more_vert,
        color: AppColors.greyText,
      ),
    );
  }
}
