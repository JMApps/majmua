import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:square_progress_indicator/square_progress_indicator.dart';

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
        height: isPortrait ? mediaQuery.size.height * 0.2 : mediaQuery.size.width * 0.2,
        child: Selector<PrayerState, DateTime>(
          selector: (context, prayerState) =>
          prayerState.prayerTimes.timeForPrayer(widget.prayer)!,
          builder: (context, currentPrayerTime, child) {
            final prayerState = context.read<PrayerState>();
            final prayerIsHourPercent = prayerState.beforeAfterHourPercent(prayerTime: currentPrayerTime);
            final isHourBefore = prayerState.isPrayerInHourRange(before: true, prayerTime: currentPrayerTime);
            final isHourAfter = prayerState.isPrayerInHourRange(before: false, prayerTime: currentPrayerTime);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  isHourBefore || isHourAfter ? Icons.radio_button_checked_rounded : Icons.circle,
                  size: isHourBefore || isHourAfter ? 12.5 : 8,
                  color: isHourBefore || isHourAfter ? appColors.tertiary : appColors.primary,
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: Card(
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    color: isHourBefore || isHourAfter ? appColors.tertiary.withAlpha(20) : appColors.surface,
                    child: SquareProgressIndicator(
                      startPosition: StartPosition.topCenter,
                      strokeCap: StrokeCap.round,
                      clockwise: true,
                      color: isHourBefore ? appColors.primary : appColors.tertiary,
                      strokeWidth: prayerIsHourPercent < 1.0 ? 2.5 : -1,
                      value: prayerIsHourPercent,
                      child: _buildPrayerContent(
                        prayerState,
                        currentPrayerTime,
                        isHourBefore,
                        isHourAfter,
                        appColors,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildPrayerContent(PrayerState prayerState, DateTime currentPrayerTime, bool isHourBefore, bool isHourAfter, ColorScheme appColors) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 2,
      children: [
        Icon(
          widget.prayerIcon,
          color: isHourAfter ? appColors.tertiary : appColors.primary,
        ),
        Text(
          widget.prayerName,
          style: AppStyles.mainTextStyleMini,
        ),
        Text(
          DateFormat('HH:mm').format(currentPrayerTime),
          style: AppStyles.mainTextStyleMiniBold,
        ),
        if (isHourBefore || prayerState.isNextPrayer(prayer: widget.prayer))
          Text(
            '–${prayerState.restPrayerTime(isBefore: true, time: currentPrayerTime)}',
            style: TextStyle(
              fontSize: 12.0,
              color: appColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        if (isHourAfter)
          Text(
            prayerState.restPrayerTime(isBefore: false, time: currentPrayerTime),
            style: TextStyle(
              fontSize: 12.0,
              color: appColors.tertiary,
              fontWeight: FontWeight.bold,
            ),
          ),
        if (prayerState.isAdhan(prayer: widget.prayer))
          const ToSupplicationsButton(
            fortressChapterId: 0,
            iconName: AppStringConstraints.iconAqsa,
          ),
        if (prayerState.isDhikr(prayer: widget.prayer))
          const ToSupplicationsButton(
            fortressChapterId: 0,
            iconName: AppStringConstraints.iconHands,
          ),
        if (widget.prayer == Prayer.fajr && prayerState.isMorning)
          const ToSupplicationsButton(
            fortressChapterId: 0,
            iconName: AppStringConstraints.iconHands,
          ),
        if (widget.prayer == Prayer.asr && prayerState.isEvening)
          const ToSupplicationsButton(
            fortressChapterId: 0,
            iconName: AppStringConstraints.iconHands,
          ),
        if (widget.prayer == Prayer.isha && prayerState.isNight)
          const ToSupplicationsButton(
            fortressChapterId: 0,
            iconName: AppStringConstraints.iconHands,
          ),
      ],
    );
  }
}