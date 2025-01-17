import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../state/prayer_state.dart';
import '../widgets/to_supplications_button.dart';

class PrayerItem extends StatefulWidget {
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
  State<PrayerItem> createState() => _PrayerItemState();
}

class _PrayerItemState extends State<PrayerItem> {
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
            DateTime currentPrayerTime = prayerState.prayerTimes.timeForPrayer(widget.prayer)!;
            bool isHourBefore = prayerState.isPrayerInHourRange(before: true, prayerTime: currentPrayerTime);
            bool isHourAfter = prayerState.isPrayerInHourRange(before: false, prayerTime: currentPrayerTime);
            return Card(
              color: isHourBefore ? appColors.tertiaryContainer : isHourAfter ? appColors.primaryContainer : appColors.surface,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.prayerIcon,
                    color: isHourBefore ? appColors.tertiary : appColors.primary,
                  ),
                  Text(
                    widget.prayerName,
                    style: const TextStyle(
                      fontSize: 15.0,
                     fontFamily: AppStringConstraints.fontGilroyMedium,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    DateFormat('HH:mm').format(prayerState.prayerTimes.timeForPrayer(widget.prayer)!),
                    style: isHourAfter || isHourBefore ? AppStyles.mainTextStyleMiniBold : AppStyles.mainTextStyleMini,
                  ),
                  Visibility(
                    visible: isHourBefore || prayerState.isNextPrayer(prayer: widget.prayer),
                    child: Text(
                      '–${prayerState.restPrayerTime(isBefore: true, time: currentPrayerTime)}',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: appColors.tertiary,
                        fontWeight: FontWeight.bold,
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: prayerState.isAdhan(prayer: widget.prayer),
                    child: const ToSupplicationsButton(
                      fortressChapterId: 0,
                      iconName: AppStringConstraints.iconAqsa,
                    ),
                  ),
                  Visibility(
                    visible: prayerState.isDhikr(prayer: widget.prayer),
                    child: const ToSupplicationsButton(
                      fortressChapterId: 0,
                      iconName: AppStringConstraints.iconHands,
                    ),
                  ),
                  Visibility(
                    visible: widget.prayer == Prayer.fajr && prayerState.isMorning,
                    child: const ToSupplicationsButton(
                      fortressChapterId: 0,
                      iconName: AppStringConstraints.iconHands,
                    ),
                  ),
                  Visibility(
                    visible: widget.prayer == Prayer.sunrise && prayerState.isSunrise,
                    child: const ToSupplicationsButton(
                      fortressChapterId: 0,
                      iconName: AppStringConstraints.iconHands,
                    ),
                  ),
                  Visibility(
                    visible: widget.prayer == Prayer.asr && prayerState.isEvening,
                    child: const ToSupplicationsButton(
                      fortressChapterId: 0,
                      iconName: AppStringConstraints.iconHands,
                    ),
                  ),
                  Visibility(
                    visible: widget.prayer == Prayer.isha && prayerState.isNight,
                    child: const ToSupplicationsButton(
                      fortressChapterId: 0,
                      iconName: AppStringConstraints.iconHands,
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