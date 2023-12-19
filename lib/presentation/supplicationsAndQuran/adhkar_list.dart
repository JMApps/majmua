import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/presentation/supplicationsAndQuran/adhkar_item.dart';

class AdhkarList extends StatelessWidget {
  const AdhkarList({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return SingleChildScrollView(
      padding: AppStyles.mainMardingMini,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Divider(indent: 16, endIndent: 16),
          AdhkarItem(
            title: appLocale!.afterPrayer,
            icon: CupertinoIcons.hand_raised,
            chapterId: 25,
          ),
          const Divider(indent: 16, endIndent: 16),
          AdhkarItem(
            title: appLocale.morning,
            icon: CupertinoIcons.sunrise,
            chapterId: 27,
          ),
          const Divider(indent: 16, endIndent: 16),
          AdhkarItem(
            title: appLocale.evening,
            icon: CupertinoIcons.sunset,
            chapterId: 28,
          ),
          const Divider(indent: 16, endIndent: 16),
          AdhkarItem(
            title: appLocale.beforeSleep,
            icon: CupertinoIcons.moon,
            chapterId: 29,
          ),
          const Divider(indent: 16, endIndent: 16),
        ],
      ),
    );
  }
}
