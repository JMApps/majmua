import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CurrentDay extends StatefulWidget {
  const CurrentDay({Key? key}) : super(key: key);

  @override
  State<CurrentDay> createState() => _CurrentDayState();
}

class _CurrentDayState extends State<CurrentDay> {
  final DateTime _dateTime = DateTime.now();

  final List<String> _weekDays = [
    'Понедельник',
    'Вторник',
    'Среда',
    'Четверг',
    'Пятница',
    'Суббота',
    'Воскресенье',
  ];

  double restDayProgress() {
    return _dateTime
            .difference(
                DateTime(_dateTime.year, _dateTime.month, _dateTime.day))
            .inMinutes *
        24 *
        60 /
        20736;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Text('Сегодня ${_dateTime.day}.${_dateTime.month}.${_dateTime.year}'),
          const SizedBox(height: 8),
          LinearPercentIndicator(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            animation: true,
            animationDuration: 750,
            barRadius: const Radius.circular(7.5),
            lineHeight: 25,
            progressColor: _dateTime.weekday == 5
                ? Colors.red.shade300
                : Colors.teal.shade300,
            percent: restDayProgress() / 100,
            center: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${_dateTime.hour}:${_dateTime.minute}  –'),
                const SizedBox(width: 8),
                Text(
                  _weekDays[_dateTime.weekday - 1],
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
