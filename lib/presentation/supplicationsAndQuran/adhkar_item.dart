import 'package:flutter/material.dart';
import 'package:majmua/core/routes/route_names.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/data/models/args/supplication_args.dart';

class AdhkarItem extends StatelessWidget {
  const AdhkarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.chapterId,
  });

  final String title;
  final IconData icon;
  final int chapterId;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, RouteNames.surahsPage, arguments: SupplicationArgs(chapterId: chapterId));
      },
      title: Text(title),
      contentPadding: AppStyles.mardingHorizontalMini,
      shape: AppStyles.mainShapeMini,
      visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
      trailing: Icon(Icons.arrow_forward_ios, color: appColors.primary),
      leading: Icon(icon, color: appColors.secondaryColor),
    );
  }
}
