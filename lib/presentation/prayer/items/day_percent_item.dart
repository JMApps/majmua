import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    return Consumer<PrayerState>(
      builder: (context, prayerState, _) {
        return LinearPercentIndicator(
          lineHeight: 22.5,
          percent: prayerState.getProgressForPart(partName: partName),
          progressColor: percentColor,
          backgroundColor: appColors.surface,
          center: Padding(
            padding: AppStyles.mardingHorizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '–${prayerState.restPrayerTime(isBefore: true, time: prayerState.thirdTime(partName: partName))}',
                  style: TextStyle(
                    color: appColors.onErrorContainer,
                  ),
                ),
                const SizedBox(width: 8),
                Text(partName.contains(AppStringConstraints.timeSunrise) && prayerState.isDuha ? '$dayTitle ${appLocale.duha}' : dayTitle),
                const SizedBox(width: 8),
                Text(
                  DateFormat('HH:mm').format(prayerState.thirdTime(partName: partName)),
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