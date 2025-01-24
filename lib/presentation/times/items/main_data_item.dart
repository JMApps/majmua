import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../state/time_state.dart';

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
                fontSize: 15.0,
                fontFamily: AppStringConstraints.fontGilroy,
                color: appColors.primary,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Visibility(
              visible: (!timeState.isRamadan() || !timeState.isDhulhijjah()) && timeState.getHijriDateTime.hDay == 12,
              child: Text(
                appLocale.nearWhiteDays,
                style: TextStyle(
                  fontSize: 13.0,
                  color: appColors.secondary,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Visibility(
              visible: (!timeState.isRamadan() || !timeState.isDhulhijjah()) && timeState.isWhiteDays(),
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 4,
                children: [
                  Text(
                    appLocale.whiteDays,
                    style: TextStyle(
                      fontSize: 13.0,
                      color: appColors.secondary,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            Text(
              '${timeState.getDateTime.day} ${appLocale.gregorianMonthNames.split(', ')[timeState.getDateTime.month - 1]} ${timeState.getDateTime.year}',
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: AppStringConstraints.fontGilroy,
                color: appColors.tertiary,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        );
      },
    );
  }
}
