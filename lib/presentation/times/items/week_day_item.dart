import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../state/prayer_state.dart';
import '../../state/time_state.dart';

class WeekDayItem extends StatefulWidget {
  const WeekDayItem({
    super.key,
    required this.dayNumber,
  });

  final int dayNumber;

  @override
  State<WeekDayItem> createState() => _WeekDayItemState();
}

class _WeekDayItemState extends State<WeekDayItem> {
  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Consumer2<TimeState, PrayerState>(
      builder: (context, timeState, prayerState, _) {
        final bool isWeekday = timeState.isWeekDay(dayNumber: widget.dayNumber);
        return Expanded(
          child: Container(
            height: 25.0,
            decoration: BoxDecoration(
              borderRadius: AppStyles.mainBorderMini,
              color: isWeekday ? getWeekDay(widget.dayNumber) : appColors.secondaryContainer,
            ),
            alignment: Alignment.center,
            child: Text(
              appLocale.week2DayNames.split(', ')[widget.dayNumber - 1],
              style: TextStyle(
                fontSize: 12.0,
                color: isWeekday ? getShadowWeekDay(widget.dayNumber) : appColors.secondary,
                fontWeight: !isWeekday ? FontWeight.normal : FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }

  Color getWeekDay(dayNumber) {
    final appColors = Theme.of(context).colorScheme;
    late Color dayColor;
    switch (dayNumber) {
      case 1:
      case 4:
        dayColor = appColors.primary;
        break;
      case 5:
        dayColor = appColors.tertiaryContainer;
        break;
      default:
        dayColor = appColors.secondary;
    }
    return dayColor;
  }

  Color getShadowWeekDay(dayNumber) {
    final appColors = Theme.of(context).colorScheme;
    late Color dayColor;
    switch (dayNumber) {
      case 1:
      case 4:
        dayColor = appColors.primaryContainer;
        break;
      case 5:
        dayColor = appColors.tertiary;
        break;
      default:
        dayColor = appColors.secondaryContainer;
    }
    return dayColor;
  }
}
