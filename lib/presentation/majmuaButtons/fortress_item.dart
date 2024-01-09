import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/data/models/args/supplication_args.dart';

import '../../core/routes/route_names.dart';
import '../../core/styles/app_styles.dart';

class FortressItem extends StatelessWidget {
  const FortressItem({
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
        switch (chapterId) {
          case 326800:
            Navigator.pushNamed(context, RouteNames.fortressChaptersPage);
          default:
            Navigator.pushNamed(
              context,
              RouteNames.fortressContentPage,
              arguments: SupplicationArgs(chapterId: chapterId),
            );
        }
      },
      title: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Text(title),
      ),
      contentPadding: AppStyles.mardingHorizontalMini,
      shape: AppStyles.mainShapeMini,
      visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
      trailing: Image.asset(
        'assets/icons/angle-right.png',
        width: 20,
        height: 20,
        color: appColors.primary,
      ),
      leading: Icon(icon, color: appColors.secondaryColor),
    );
  }
}
