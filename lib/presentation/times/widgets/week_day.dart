import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../state/prayer_state.dart';
import '../../state/time_state.dart';

class WeekDay extends StatelessWidget {
  const WeekDay({
    super.key,
    required this.dayNumber,
  });

  final int dayNumber;

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Consumer2<TimeState, PrayerState>(
      builder: (context, timeState, prayerState, _) {
        final bool isWeekday = timeState.isWeekDay(dayNumber: dayNumber);
        return Container(
          padding: AppStyles.mainMardingMini,
          decoration: BoxDecoration(
            borderRadius: AppStyles.mainBorderMini,
            color: isWeekday ? timeState.isFriday() ? appColors.errorContainer : appColors.tertiaryContainer : appColors.secondaryContainer,
          ),
          child: Column(
            children: [
              Text(
                appLocale.week2DayNames.split(', ')[dayNumber - 1],
                style: TextStyle(
                  fontWeight: isWeekday ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
