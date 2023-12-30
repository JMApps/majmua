import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';

import '../../core/routes/route_names.dart';
import '../../core/styles/app_styles.dart';
import '../../data/models/args/surah_args.dart';

class SurahItem extends StatelessWidget {
  const SurahItem({
    super.key,
    required this.title,
    required this.icon,
    required this.surahNumber,
    required this.surahKey,
  });

  final String title;
  final IconData icon;
  final int surahNumber;
  final String surahKey;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(
          context,
          RouteNames.surahsPage,
          arguments: SurahArgs(
            surahNumber: surahNumber,
            surahName: title,
            surahKey: surahKey,
          ),
        );
      },
      title: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Text(
          title,
          textAlign: TextAlign.end,
        ),
      ),
      contentPadding: AppStyles.mardingHorizontalMini,
      shape: AppStyles.mainShapeMini,
      visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
      leading: Image.asset(
        'assets/icons/angle-left.png',
        width: 20,
        height: 20,
        color: appColors.primary,
      ),
      trailing: Icon(icon, color: appColors.secondaryColor),
    );
  }
}
