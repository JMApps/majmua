import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/themes/app_themes.dart';

import '../../core/routes/route_names.dart';
import '../../core/styles/app_styles.dart';
import '../../data/models/args/supplication_args.dart';
import 'fortress_item.dart';

class FortressList extends StatelessWidget {
  const FortressList({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return SingleChildScrollView(
      padding: AppStyles.mainMardingMini,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Divider(indent: 16, endIndent: 16),
          ListTile(
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNames.fortressContentPage,
                arguments: const SupplicationArgs(chapterId: 25),
              );
            },
            title: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(appLocale!.afterPrayer),
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
            leading: Image.asset(
              'assets/icons/dua-hands.png',
              width: 20,
              height: 20,
              color: appColors.secondaryColor,
            ),
          ),
          const Divider(indent: 16, endIndent: 16),
          FortressItem(
            title: appLocale.morning,
            icon: CupertinoIcons.sunrise,
            chapterId: 27,
          ),
          const Divider(indent: 16, endIndent: 16),
          FortressItem(
            title: appLocale.evening,
            icon: CupertinoIcons.sunset,
            chapterId: 28,
          ),
          const Divider(indent: 16, endIndent: 16),
          FortressItem(
            title: appLocale.beforeSleep,
            icon: CupertinoIcons.moon_zzz,
            chapterId: 29,
          ),
          const Divider(indent: 16, endIndent: 16),
          FortressItem(
            title: appLocale.allChapters,
            icon: CupertinoIcons.square_list,
            chapterId: 326800,
          ),
          const Divider(indent: 16, endIndent: 16),
        ],
      ),
    );
  }
}
