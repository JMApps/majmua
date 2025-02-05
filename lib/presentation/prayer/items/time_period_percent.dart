import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../state/prayer_state.dart';

class TimePeriodPercent extends StatelessWidget {
  const TimePeriodPercent({
    super.key,
    required this.dayTitle,
    required this.partName,
    required this.cardColor,
    required this.textColor,
  });

  final String dayTitle;
  final String partName;
  final Color cardColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Consumer<PrayerState>(
      builder: (context, prayerState, _) {
        return Card(
          color: cardColor,
          child: Padding(
            padding: AppStyles.mardingHorizontalMini,
            child: Row(
              children: [
                Expanded(
                  child: Visibility(
                    visible: !prayerState.thirdState(partName: partName),
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Text(
                      '-${prayerState.restPrayerTime(isBefore: true, time: prayerState.thirdTime(partName: partName))}',
                      style: TextStyle(
                        color: textColor,
                        fontFamily: AppStringConstraints.fontGilroyMedium,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    partName.contains(AppStringConstraints.timeSunrise) && prayerState.isDuha ? appLocale.adDuhaTime : dayTitle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    DateFormat('HH:mm').format(prayerState.thirdTime(partName: partName)),
                    style: TextStyle(
                      color: textColor,
                      fontFamily: AppStringConstraints.fontGilroyMedium,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
