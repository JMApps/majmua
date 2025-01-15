import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../state/prayer_state.dart';

class TimePeriodPercent extends StatelessWidget {
  const TimePeriodPercent({
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
    final mediaQuerySize = MediaQuery.of(context).size.width;
    return Consumer<PrayerState>(
      builder: (context, prayerState, _) {
        return LinearPercentIndicator(
          lineHeight: 22.5,
          padding: EdgeInsets.zero,
          percent: prayerState.thirdState(partName: partName) ? 1.0 : prayerState.getProgressForPart(partName: partName),
          progressColor: percentColor,
          backgroundColor: appColors.surface,
          center: Padding(
            padding: AppStyles.mardingHorizontalMini,
            child: Row(
              children: [
                SizedBox(
                  width: mediaQuerySize * 0.1,
                  child: Visibility(
                    visible: !prayerState.thirdState(partName: partName),
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Text(
                      '–${prayerState.restPrayerTime(isBefore: true, time: prayerState.thirdTime(partName: partName))}',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: appColors.onErrorContainer,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    partName.contains(AppStringConstraints.timeSunrise) && prayerState.isDuha ? '$dayTitle ${appLocale.duha}' : dayTitle,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: mediaQuerySize * 0.075,
                  child: Text(
                    DateFormat('HH:mm').format(prayerState.thirdTime(partName: partName)),
                    style: const TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
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
