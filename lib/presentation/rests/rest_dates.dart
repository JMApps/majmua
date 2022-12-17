import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/presentation/rests/percent_circular.dart';

class RestDates extends StatelessWidget {
  const RestDates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Уходят дни – уходит часть тебя',
          style: MainAppStyle.mainTextSizeStyle,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PercentCircular(
              time: 'День',
              progressColor: Colors.indigo.shade300,
              percent: MainAppStyle.restDayProgress(),
              firstPercent: '-${(MainAppStyle.restDayProgress()).toStringAsFixed(2)}%',
              secondPercent: '${(MainAppStyle.restDayProgress() - 100).toStringAsFixed(2).substring(1)}%',
            ),
            PercentCircular(
              time: 'Неделя',
              progressColor: Colors.teal.shade300,
              percent: MainAppStyle.restWeekProgress(),
              firstPercent: '-${(MainAppStyle.restWeekProgress()).toStringAsFixed(2)}%',
              secondPercent: '${(MainAppStyle.restWeekProgress() - 100).toStringAsFixed(2).substring(1)}%',
            ),
            PercentCircular(
              time: 'Месяц',
              progressColor: Colors.deepOrange.shade300,
              percent: MainAppStyle.restMonthProgress(),
              firstPercent: '-${(MainAppStyle.restMonthProgress()).toStringAsFixed(2)}%',
              secondPercent: '${(MainAppStyle.restMonthProgress() - 100).toStringAsFixed(2).substring(1)}%',
            ),
            PercentCircular(
              time: 'Год',
              progressColor: Colors.purple.shade300,
              percent: MainAppStyle.restYearProgress(),
              firstPercent: '-${(MainAppStyle.restYearProgress()).toStringAsFixed(2)}%',
              secondPercent: '${(MainAppStyle.restYearProgress() - 100).toStringAsFixed(2).substring(1)}%',
            ),
          ],
        ),
      ],
    );
  }
}
