import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
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
    return Consumer<TimeState>(
      builder: (context, timeState, _) {
        final bool isWeekday = timeState.getDateTime.weekday == widget.dayNumber;
        return Expanded(
          child: SizedBox(
            height: 25.0,
            child: Tooltip(
              message: isWeekday ? '${appLocale.week2DayNames.split(', ')[widget.dayNumber - 1]} / ${DateFormat('dd.MM.yyyy').format(DateTime.now())}' : '',
              child: Card(
                color: isWeekday && timeState.getDateTime.weekday == 5 ? appColors.tertiaryContainer : isWeekday ? appColors.primary : appColors.secondaryContainer,
                child: Center(
                  child: Padding(
                    padding: AppStyles.mardingTopMicroMini,
                    child: Text(
                      appLocale.week2DayNamesShort.split(', ')[widget.dayNumber - 1],
                      style: TextStyle(
                        fontSize: 13.0,
                        color: isWeekday && timeState.getDateTime.weekday == 5 ? appColors.tertiary : isWeekday ? appColors.primaryContainer : appColors.secondary,
                        fontWeight: !isWeekday ? FontWeight.normal : FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
