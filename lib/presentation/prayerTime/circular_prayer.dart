import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/presentation/restTime/rest_times.dart';

class CircularPrayer extends StatefulWidget {
  const CircularPrayer({
    Key? key,
    required this.prayerName,
    required this.prayerTime,
    required this.currentPrayerTimeValue,
    required this.nextPrayerTimeValue,
    required this.leftPrayerTime,
  }) : super(key: key);

  final String prayerName;
  final DateTime prayerTime;
  final int currentPrayerTimeValue;
  final int nextPrayerTimeValue;
  final DateTime leftPrayerTime;

  @override
  State<CircularPrayer> createState() => _CircularPrayerState();
}

class _CircularPrayerState extends State<CircularPrayer> {
  final RestTimes _restTimes = RestTimes();
  late final bool _isPrayerTime;

  @override
  void initState() {
    _isPrayerTime = _restTimes.getMinuteOfDay > widget.currentPrayerTimeValue &&
        _restTimes.getMinuteOfDay < widget.nextPrayerTimeValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.prayerName,
          style: TextStyle(
            fontSize: 12,
            color: _isPrayerTime ? Colors.indigo : Colors.black,
          ),
        ),
        Card(
          elevation: 0,
          shape: AppStyles.mainCardBorderRadius,
          child: Card(
            elevation: 0,
            color: _isPrayerTime ? Colors.white : Colors.indigo.shade50,
            shape: RoundedRectangleBorder(
              borderRadius: AppStyles.mainBorderRadius,
              side: BorderSide(
                width: 1,
                color: _isPrayerTime ? Colors.indigo : Colors.white,
              ),
            ),
            child: Padding(
              padding: AppStyles.mainPaddingMini,
              child: Text(
                DateFormat.Hm().format(widget.prayerTime),
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: _isPrayerTime,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Text(
            DateFormat.Hm().format(widget.leftPrayerTime),
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        )
      ],
    );
  }
}
