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
    final double screenWidth = MediaQuery.of(context).size.width;
    final RestTimeState timeState = Provider.of<RestTimeState>(context);
    return Card(
      margin: EdgeInsets.zero,
      color: appColors.glass,
      shape: AppStyles.mainShapeMicro,
      child: Padding(
        padding: AppStyles.mainMardingMini,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 4,
              child: Text(
                timeState.currentHijriTime.hDay == 12
                    ? appLocale!.nearWhiteDays
                    : appLocale!.whiteDays,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 8),
            const Expanded(
              flex: 3,
              child: Card(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: AppStyles.mainMardingMicro,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: 8),
                      Flexible(
                        child: WhiteDayCircle(dayIndex: 13),
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        child: WhiteDayCircle(dayIndex: 14),
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        child: WhiteDayCircle(dayIndex: 15),
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
