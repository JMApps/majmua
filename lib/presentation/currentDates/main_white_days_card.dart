import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/currentDates/white_day_circle.dart';
import 'package:majmua/presentation/state/rest_time_state.dart';
import 'package:provider/provider.dart';

class MainWhiteDaysCard extends StatelessWidget {
  const MainWhiteDaysCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final RestTimeState timeState = Provider.of<RestTimeState>(context);
    return Card(
      margin: EdgeInsets.zero,
      color: appColors.glass,
      child: ListTile(
        visualDensity: const VisualDensity(horizontal: -4),
        title: Text(
          timeState.currentHijriTime.hDay == 12
              ? appLocale!.nearWhiteDays
              : appLocale!.whiteDays,
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
