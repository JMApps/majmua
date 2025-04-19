import 'package:flutter/material.dart';

import '../../../core/routes/app_route_names.dart';
import '../../../core/styles/app_styles.dart';
import '../../../data/models/args/quran_args.dart';

class SurahItem extends StatelessWidget {
  const SurahItem({
    super.key,
    required this.surahName,
    required this.listPages,
    required this.icon,
  });

  final String surahName;
  final List<String> listPages;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return ListTile(
      onTap: () async {
        Navigator.pop(context);
        await Navigator.pushNamed(
          context,
          AppRouteNames.pageQuran,
          arguments: QuranArgs(
            surahName: surahName,
            listPages: listPages,
          ),
        );
      },
      horizontalTitleGap: 16,
      contentPadding: AppStyles.mardingHorizontalMini,
      visualDensity: VisualDensity.compact,
      shape: AppStyles.mainShapeMini,
      title: Text(surahName),
      leading: Icon(
        icon,
        color: appColors.primary,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: appColors.primary,
      ),
    );
  }
}
