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
    required this.remainingPrayerTime,
    required this.pastPrayerTime,
  }) : super(key: key);

  final String prayerName;
  final DateTime prayerTime;
  final int previousPrayerTimeValue;
  final int currentPrayerTimeValue;
  final DateTime remainingPrayerTime;
  final DateTime pastPrayerTime;

  @override
  State<CircularPrayer> createState() => _CircularPrayerState();
}

class _CircularPrayerState extends State<CircularPrayer> {
  final RestTimes _restTimes = RestTimes();
  late final bool _isPrayerTime;
  late final bool _isPastTime;
  late final bool _isRemainingTime;

  @override
  void initState() {
    _isPrayerTime =
        _restTimes.getMinuteOfDay > widget.previousPrayerTimeValue &&
            _restTimes.getMinuteOfDay <= widget.currentPrayerTimeValue + 30;
    _isRemainingTime =
        _restTimes.getMinuteOfDay > widget.previousPrayerTimeValue &&
            _restTimes.getMinuteOfDay <= widget.currentPrayerTimeValue;
    _isPastTime = _restTimes.getMinuteOfDay > widget.previousPrayerTimeValue &&
        _restTimes.getMinuteOfDay <= widget.currentPrayerTimeValue;
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
                ? _isPastTime
                    ? appColors.prayerTimeFirstActiveCardColor
                    : appColors.prayerTimeSecondActiveCardColor
                : appColors.mainTextColor,
          ),
        ),
        const SizedBox(height: 4),
        Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: AppStyles.topCardBorderRadius,
          color: _isPrayerTime
              ? _isPastTime
                  ? appColors.prayerTimeFirstActiveCardColor
                  : appColors.thirdAppColor
              : appColors.prayerTimeFirstCardColor,
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
          color: appColors.prayerTimeSecondCardColor,
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
          visible: _isRemainingTime,
          child: Text(
            '-${DateFormat.Hm().format(widget.remainingPrayerTime)}',
            style: const TextStyle(
              fontSize: 13,
              fontFamily: 'Lato',
            ),
          ),
        ),
        Visibility(
          visible: _isPrayerTime
              ? _isPastTime
                  ? false
                  : true
              : false,
          child: Text(
            DateFormat.Hm().format(widget.pastPrayerTime),
            style: const TextStyle(
              fontSize: 13,
              fontFamily: 'Lato',
            ),
          ),
        )
      ],
    );
  }
}
