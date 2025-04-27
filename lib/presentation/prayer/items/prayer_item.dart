import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
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
    return Expanded(
      child: SizedBox(
        height: isPortrait ? mediaQuery.size.height * 0.15 : mediaQuery.size.width * 0.15,
        child: Consumer<PrayerState>(
          builder: (context, prayerState, _) {
            DateTime currentPrayerTime = prayerState.prayerTimes.timeForPrayer(prayer)!;
            bool isHourBefore = prayerState.isPrayerInHourRange(before: true, prayerTime: currentPrayerTime);
            bool isHourAfter = prayerState.isPrayerInHourRange(before: false, prayerTime: currentPrayerTime);
            return Card(
              color: isHourBefore ? appColors.tertiaryContainer : isHourAfter ? appColors.primaryContainer : appColors.surface,
              shape: AppStyles.mainShapeMini,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tooltip(
                    message: '-${prayerState.restPrayerTime(isBefore: true, time: currentPrayerTime)}',
                    child: Icon(
                      prayerIcon,
                      color: isHourBefore ? appColors.tertiary : appColors.primary,
                    ),
                  ),
                  Text(
                    prayerName,
                    style: TextStyle(
                      fontFamily: isHourAfter || isHourBefore ? AppStringConstraints.fontGilroyMedium : AppStringConstraints.fontGilroy,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    DateFormat('HH:mm').format(prayerState.prayerTimes.timeForPrayer(prayer)!.add(prayerState.dst ? const Duration(hours: -1) : const Duration(hours: 0))),
                    style: isHourAfter || isHourBefore ? AppStyles.mainTextStyleMiniBold : AppStyles.mainTextStyleMini,
                  ),
                  Visibility(
                    visible: isHourBefore || prayerState.isNextPrayer(prayer: prayer),
                    child: Text(
                      '-${prayerState.restPrayerTime(isBefore: true, time: currentPrayerTime)}',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: appColors.tertiary,
                        fontFamily: AppStringConstraints.fontGilroyMedium,
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
                        fontFamily: AppStringConstraints.fontGilroyMedium,
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
