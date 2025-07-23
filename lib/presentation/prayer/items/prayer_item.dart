import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../state/prayer_state.dart';

class PrayerItem extends StatelessWidget {
  const PrayerItem({
    super.key,
    required this.prayer,
    required this.prayerName,
    required this.prayerIcon,
  });

  final Prayer prayer;
  final String prayerName;
  final IconData prayerIcon;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final mediaQuery = MediaQuery.of(context);
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    final is24h = mediaQuery.alwaysUse24HourFormat;

    final timeFormatter = DateFormat(is24h ? 'HH:mm' : 'hh:mm');
    final periodFormatter = DateFormat('a'); // AM / PM

    return Expanded(
      child: SizedBox(
        height: isPortrait ? mediaQuery.size.height * 0.15 : mediaQuery.size.width * 0.15,
        child: Consumer<PrayerState>(
          builder: (context, prayerState, _) {
            DateTime currentPrayerTime =
            prayerState.prayerTimes.timeForPrayer(prayer)!;
            bool isHourBefore = prayerState.isPrayerInHourRange(before: true, prayerTime: currentPrayerTime);
            bool isHourAfter = prayerState.isPrayerInHourRange(before: false, prayerTime: currentPrayerTime);
            return Card(
              color: isHourBefore ? appColors.tertiaryContainer : isHourAfter ? appColors.primaryContainer : appColors.surface,
              shape: AppStyles.mainShapeMini,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tooltip(
                    message:
                    '-${prayerState.restPrayerTime(isBefore: true, time: currentPrayerTime)}',
                    child: Icon(
                      prayerIcon,
                      color: isHourBefore ? appColors.tertiary : appColors.primary,
                    ),
                  ),
                  Text(
                    prayerName,
                    style: TextStyle(
                      fontWeight: isHourAfter || isHourBefore ? FontWeight.bold : FontWeight.normal,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  is24h ? Text(
                    timeFormatter.format(currentPrayerTime.toLocal()),
                    style: isHourAfter || isHourBefore ? AppStyles.mainTextStyleMiniBold : AppStyles.mainTextStyleMini,
                  ) : Column(
                    children: [
                      Text(
                        timeFormatter.format(currentPrayerTime.toLocal()),
                        style: isHourAfter || isHourBefore ? AppStyles.mainTextStyleMiniBold : AppStyles.mainTextStyleMini,
                      ),
                      Text(
                        periodFormatter.format(currentPrayerTime.toLocal()),
                        style: TextStyle(
                          fontSize: 10,
                          color: appColors.outline,
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: isHourBefore || prayerState.isNextPrayer(prayer: prayer),
                    child: Text(
                      '-${prayerState.restPrayerTime(isBefore: true, time: currentPrayerTime)}',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: appColors.tertiary,
                      ),
                    ),
                  ),

                  Visibility(
                    visible: isHourAfter,
                    child: Text(
                      prayerState.restPrayerTime(isBefore: false, time: currentPrayerTime),
                      style: TextStyle(
                        fontSize: 12.0,
                        color: appColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
