import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/time_state.dart';
import '../items/all_hijri_item.dart';

class AllHijriDates extends StatelessWidget {
  const AllHijriDates({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      padding: AppStyles.mardingWithoutTop,
      child: Consumer<TimeState>(
        builder: (context, timeState, _) {
          final ramadan = timeState.getDaysToHijriDate(
            hijriMonth: 9,
            hijriDay: 1,
            daysKey: AppStringConstraints.mapDaysToRamadan,
            dateKey: AppStringConstraints.mapRamadanDate,
          );

          final fitr = timeState.getDaysToHijriDate(
            hijriMonth: 10,
            hijriDay: 1,
            daysKey: AppStringConstraints.mapDaysToIdAlFitr,
            dateKey: AppStringConstraints.mapIdAlFitrDate,
          );

          final dhulHijjah = timeState.getDaysToHijriDate(
            hijriMonth: 12,
            hijriDay: 1,
            daysKey: AppStringConstraints.mapDaysToDhulHijjah,
            dateKey: AppStringConstraints.mapDhulHijjahDate,
          );

          final adha = timeState.getDaysToHijriDate(
            hijriMonth: 12,
            hijriDay: 10,
            daysKey: AppStringConstraints.mapDaysToIdAlAdha,
            dateKey: AppStringConstraints.mapIdAlAdhaDate,
          );

          final arafa = timeState.getDaysToHijriDate(
            hijriMonth: 12,
            hijriDay: 9,
            daysKey: AppStringConstraints.mapDaysToArafa,
            dateKey: AppStringConstraints.mapArafaDate,
          );

          final ashura = timeState.getDaysToHijriDate(
            hijriMonth: 1,
            hijriDay: 10,
            daysKey: AppStringConstraints.mapDaysToAshura,
            dateKey: AppStringConstraints.mapAshuraDate,
          );

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AllHijriItem(
                eventName: appLocale.startRamadan,
                eventDate: ramadan[AppStringConstraints.mapRamadanDate],
                remindDays: ramadan[AppStringConstraints.mapDaysToRamadan],
                circleNumber: 1,
              ),
              AllHijriItem(
                eventName: appLocale.idAlFitr,
                eventDate: fitr[AppStringConstraints.mapIdAlFitrDate],
                remindDays: fitr[AppStringConstraints.mapDaysToIdAlFitr],
                circleNumber: 2,
              ),
              AllHijriItem(
                eventName: appLocale.startDhulHijjah,
                eventDate: dhulHijjah[AppStringConstraints.mapDhulHijjahDate],
                remindDays: dhulHijjah[AppStringConstraints.mapDaysToDhulHijjah],
                circleNumber: 3,
              ),
              AllHijriItem(
                eventName: appLocale.dayArafa,
                eventDate: arafa[AppStringConstraints.mapArafaDate],
                remindDays: arafa[AppStringConstraints.mapDaysToArafa],
                circleNumber: 4,
              ),
              AllHijriItem(
                eventName: appLocale.idAlAdha,
                eventDate: adha[AppStringConstraints.mapIdAlAdhaDate],
                remindDays: adha[AppStringConstraints.mapDaysToIdAlAdha],
                circleNumber: 5,
              ),
              AllHijriItem(
                eventName: appLocale.dayAshura,
                eventDate: ashura[AppStringConstraints.mapAshuraDate],
                remindDays: ashura[AppStringConstraints.mapDaysToAshura],
                circleNumber: 6,
              ),
            ],
          );
        },
      ),
    );
  }
}
