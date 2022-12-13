import 'package:flutter/material.dart';
import 'package:majmua/application/state/main_app_state.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class CurrentDay extends StatelessWidget {
  const CurrentDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readMainState = context.read<MainAppState>();
    return Column(
      children: [
        const SizedBox(height: 16),
        const Text(
          'Сегодня',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '${MainAppStyle.getHijriDate()} / ${MainAppStyle.getGregorianDate()}',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.teal,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '${MainAppStyle.getMonthHijriNames} / ${MainAppStyle.getMonthNames}',
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Осталось дней до Рамадана: ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.indigo,
                  fontFamily: 'Gilroy',
                ),
              ),
              TextSpan(
                text: MainAppStyle.toRamadan().substring(1),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                  fontFamily: 'Gilroy',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {
            readMainState.setPercentTextChange();
          },
          child: LinearPercentIndicator(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            animation: true,
            animationDuration: 750,
            barRadius: const Radius.circular(15),
            lineHeight: 40,
            progressColor: Colors.primaries[MainAppStyle.dateTime.weekday * 2],
            percent: readMainState.restDayProgress() / 100,
            center: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 16),
                Text('-${(readMainState.restDayProgress()).toStringAsFixed(2)}%'),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    context.watch<MainAppState>().getIsTextPercentChange
                        ? '${DateTime.now().toString().substring(11, 16)} – '
                            '${MainAppStyle.dateTimeHijri.dayWeName}'
                        : 'Уходят дни – уходит часть тебя',
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Gilroy',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 8),
                Text('${(readMainState.restDayProgress() - 100).toStringAsFixed(2).substring(1)}%'),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ),
        MainAppStyle.getMessagesForDays.isNotEmpty
            ? const SizedBox(height: 16)
            : const SizedBox(),
        MainAppStyle.getMessagesForDays.isNotEmpty
            ? Card(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: MainAppStyle.mainBorderRadius,
                ),
                child: Padding(
                  padding: MainAppStyle.mainPadding,
                  child: Text(
                    MainAppStyle.getMessagesForDays,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.teal,
                      fontFamily: 'Gilroy',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
