import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:majmua/application/state/main_app_state.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class CurrentDay extends StatefulWidget {
  const CurrentDay({Key? key}) : super(key: key);

  @override
  State<CurrentDay> createState() => _CurrentDayState();
}

class _CurrentDayState extends State<CurrentDay> {

  final DateTime _dateTime = DateTime.now();
  final HijriCalendar _dateTimeHijri = HijriCalendar.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Text('Сегодня ${_dateTimeHijri.hDay}.${_dateTimeHijri.hMonth}.${_dateTimeHijri.hYear}'
              ' / ${_dateTime.day}.${_dateTime.month}.${_dateTime.year}'),
          const SizedBox(height: 8),
          Text('${context.read<MainAppState>().getMonthHijriNames[_dateTimeHijri.hMonth - 1]} / '
              '${context.read<MainAppState>().getMonthNames[_dateTime.month - 1]}'),
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
            percent: context.read<MainAppState>().restDayProgress() / 100,
            center: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${_dateTime.hour}:${_dateTime.minute}  –'),
                const SizedBox(width: 8),
                Text(
                  _dateTimeHijri.dayWeName,
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
