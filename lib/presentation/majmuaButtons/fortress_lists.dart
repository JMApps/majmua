import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/styles/app_styles.dart';
import 'fortress_item.dart';

class FortressList extends StatelessWidget {
  const FortressList({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return SingleChildScrollView(
      padding: AppStyles.mainMardingMini,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Divider(indent: 16, endIndent: 16),
          FortressItem(
            title: appLocale!.afterPrayer,
            icon: CupertinoIcons.hand_raised,
            chapterId: 25,
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
            icon: CupertinoIcons.moon_stars,
            chapterId: 29,
          ),
          const Divider(indent: 16, endIndent: 16),
          FortressItem(
            title: appLocale.allChapters,
            icon: CupertinoIcons.list_bullet_below_rectangle,
            chapterId: 326800,
          ),
          const Divider(indent: 16, endIndent: 16),
        ],
      ),
    );
  }
}