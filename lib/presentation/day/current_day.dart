import 'package:flutter/material.dart';
import 'package:majmua/application/state/main_app_state.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class CurrentDay extends StatelessWidget {
  const CurrentDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Text(
              'Сегодня ${MainAppStyle.dateTimeHijri.hDay}.${MainAppStyle.dateTimeHijri.hMonth}.${MainAppStyle.dateTimeHijri.hYear}'
              ' / ${MainAppStyle.dateTime.day}.${MainAppStyle.dateTime.month}.${MainAppStyle.dateTime.year}'),
          const SizedBox(height: 8),
          Text(
              '${context.read<MainAppState>().getMonthHijriNames[MainAppStyle.dateTimeHijri.hMonth - 1]} / '
              '${context.read<MainAppState>().getMonthNames[MainAppStyle.dateTime.month - 1]}'),
          const SizedBox(height: 8),
          LinearPercentIndicator(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            animation: true,
            animationDuration: 750,
            barRadius: const Radius.circular(7.5),
            lineHeight: 25,
            progressColor: MainAppStyle.dateTime.weekday == 5
                ? const Color(0xFFE57373)
                : const Color(0xFF4DB6AC),
            percent: context.read<MainAppState>().restDayProgress() / 100,
            center: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    '${MainAppStyle.dateTime.hour}:${MainAppStyle.dateTime.minute}  –'),
                const SizedBox(width: 8),
                Text(
                  MainAppStyle.dateTimeHijri.dayWeName,
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
