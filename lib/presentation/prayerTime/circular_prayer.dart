import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:majmua/presentation/restTime/rest_times.dart';

class CircularPrayer extends StatefulWidget {
  const CircularPrayer({
    Key? key,
    required this.prayerName,
    required this.prayerTime,
    required this.previousPrayerTimeValue,
    required this.currentPrayerTimeValue,
    required this.toPrayerTime,
    required this.fromPrayerTime,
  }) : super(key: key);

  final String prayerName;
  final DateTime prayerTime;
  final int previousPrayerTimeValue;
  final int currentPrayerTimeValue;
  final DateTime toPrayerTime;
  final DateTime fromPrayerTime;

  @override
  State<CircularPrayer> createState() => _CircularPrayerState();
}

class _CircularPrayerState extends State<CircularPrayer> {
  final RestTimes _restTimes = RestTimes();
  late final bool _isPrayerTime;
  late final bool _isRemainingTime;
  late final bool _isPastTime;

  @override
  void initState() {
    int currentTime = _restTimes.getMinuteOfDay;
    _isPrayerTime = currentTime > widget.currentPrayerTimeValue - 60 && currentTime < widget.currentPrayerTimeValue + 31;
    _isRemainingTime = currentTime > widget.currentPrayerTimeValue - 60 && currentTime < widget.currentPrayerTimeValue;
    _isPastTime = currentTime > widget.currentPrayerTimeValue && currentTime < widget.currentPrayerTimeValue + 31;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Column(
      children: [
        Text(
          widget.prayerName,
          style: TextStyle(
            fontSize: 12,
            color: _isPrayerTime
                ? appColors.thirdAppColor
                : Theme.of(context).colorScheme.mainTextColor,
          ),
        ),
        const SizedBox(height: 4),
        Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: AppStyles.topCardBorderRadius,
          color: _isPrayerTime
              ? appColors.thirdAppColor
              : appColors.secondAppColor,
          child: Padding(
            padding: AppStyles.mainPaddingMini,
            child: Text(
              DateFormat.Hm().format(widget.prayerTime).substring(0, 2),
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Lato',
                color: Colors.white,
              ),
            ),
          ),
        ),
        Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: AppStyles.bottomCardBorderRadius,
          color: appColors.firstAppColor,
          child: Padding(
            padding: AppStyles.mainPaddingMini,
            child: Text(
              DateFormat.Hm().format(widget.prayerTime).substring(3),
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Lato',
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Visibility(
          visible: _isPrayerTime && _isRemainingTime,
          child: Text(
            '-${DateFormat.m().format(widget.fromPrayerTime)}',
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
        ),
        Visibility(
          visible: _isPastTime && _isPastTime,
          child: Text(
            DateFormat.m().format(widget.toPrayerTime),
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
