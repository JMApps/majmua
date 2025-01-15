import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../state/time_state.dart';
import 'white_day_item.dart';

class MainDataItem extends StatelessWidget {
  const MainDataItem({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Consumer<TimeState>(
      builder: (context, timeState, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '${timeState.getHijriDateTime.hDay} ${appLocale.hijriMonthNames.split(', ')[timeState.getHijriDateTime.hMonth - 1]} ${timeState.getHijriDateTime.hYear}',
              style: TextStyle(
                fontSize: 17.0,
                fontFamily: AppStringConstraints.fontGilroy,
                color: appColors.primary,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Visibility(
              visible: timeState.getHijriDateTime.hDay == 12,
              child: Text(
                'Приблизились белые дни',
                style: TextStyle(
                  fontSize: 12.0,
                  color: appColors.secondary,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Visibility(
              visible: timeState.isWhiteDays(),
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 4,
                children: [
                  Text(
                    'Белые дни',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: appColors.secondary,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  WhiteDayItem(
                    dayNumber: 13,
                    dayColor: timeState.getHijriDateTime.hDay == 13
                        ? appColors.tertiaryContainer
                        : appColors.secondaryContainer,
                  ),
                  WhiteDayItem(
                    dayNumber: 14,
                    dayColor: timeState.getHijriDateTime.hDay == 14
                        ? appColors.tertiaryContainer
                        : appColors.secondaryContainer,
                  ),
                  WhiteDayItem(
                    dayNumber: 15,
                    dayColor: timeState.getHijriDateTime.hDay == 15
                        ? appColors.tertiaryContainer
                        : appColors.secondaryContainer,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
