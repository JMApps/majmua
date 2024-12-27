import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../state/prayer_state.dart';

class DayPercentItem extends StatelessWidget {
  const DayPercentItem({
    super.key,
    required this.dayTitle,
    required this.partName,
    required this.percentColor,
  });

  final String dayTitle;
  final String partName;
  final Color percentColor;

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;

    return Selector<PrayerState, double>(
      selector: (context, prayerState) => prayerState.getProgressForPart(partName),
      builder: (context, progress, _) {
        final prayerState = context.read<PrayerState>();
        final thirdTime = prayerState.thirdTime(partName: partName);
        final isDuha = partName.contains(AppStringConstraints.timeSunrise) && prayerState.isDuha;
        final displayText = isDuha ? '$dayTitle ${appLocale.duha}' : dayTitle;
        return LinearPercentIndicator(
          lineHeight: 22.5,
          percent: progress,
          progressColor: percentColor,
          backgroundColor: appColors.surface,
          center: Padding(
            padding: AppStyles.mardingHorizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  !isDuha ? '–${prayerState.restPrayerTime(isBefore: true, time: thirdTime)}' : '',
                  style: TextStyle(
                    color: appColors.onErrorContainer,
                  ),
                ),
                Expanded(
                  child: Text(
                    displayText,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  DateFormat('HH:mm').format(thirdTime),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          barRadius: const Radius.circular(8),
        );
      },
    );
  }
}
