import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/currentDates/white_day_circle.dart';

class MainWhiteDaysCard extends StatelessWidget {
  const MainWhiteDaysCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Card(
      margin: EdgeInsets.zero,
      color: appColors.glass,
      child: ListTile(
        visualDensity: const VisualDensity(horizontal: -4),
        title: Text(
          appLocale!.whiteDays,
          textAlign: TextAlign.center,
        ),
        trailing: const Padding(
          padding: AppStyles.mainMardingMicro,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(width: 8),
              WhiteDayCircle(dayIndex: 13),
              SizedBox(width: 8),
              WhiteDayCircle(dayIndex: 14),
              SizedBox(width: 8),
              WhiteDayCircle(dayIndex: 15),
              SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}
