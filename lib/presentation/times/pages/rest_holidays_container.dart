import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../state/time_state.dart';
import '../items/remind_holiday_days_item.dart';

class RestHolidaysContainer extends StatelessWidget {
  const RestHolidaysContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Consumer<TimeState>(
      builder: (context, timeState, _) {
        return SizedBox(
          height: 90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: RemindHolidayDaysItem(
                  remindTitle: !timeState.isRamadan() ? appLocale.daysToRamadan : appLocale.blessedRamadan,
                  remindDays: !timeState.isRamadan() ? timeState.getDaysToRamadan()[AppStringConstraints.mapDaysToRamadan] : timeState.getHijriDateTime.hDay,
                  eventDate: DateFormat('dd.MM.yyyy').format(timeState.getDaysToRamadan()[AppStringConstraints.mapRamadanDate]),
                  itemColor: appColors.primaryContainer,
                  textColor: appColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: RemindHolidayDaysItem(
                  remindTitle: !timeState.isDhulhijjah() ? appLocale.daysToDhulHujjah : appLocale.dhulHijjah,
                  remindDays: !timeState.isDhulhijjah() ? timeState.getDaysToDhulHijjah()[AppStringConstraints.mapDaysToDhulHijjah] : timeState.getHijriDateTime.hDay,
                  eventDate: DateFormat('dd.MM.yyyy').format(timeState.getDaysToDhulHijjah()[AppStringConstraints.mapDhulHijjahDate]),
                  itemColor: appColors.tertiaryContainer,
                  textColor: appColors.tertiary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
