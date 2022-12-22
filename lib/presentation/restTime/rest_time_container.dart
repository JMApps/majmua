import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/presentation/restTime/circular_percent.dart';
import 'package:majmua/presentation/restTime/rest_times.dart';

class RestTimeContainer extends StatefulWidget {
  const RestTimeContainer({Key? key}) : super(key: key);

  @override
  State<RestTimeContainer> createState() => _RestTimeContainerState();
}

class _RestTimeContainerState extends State<RestTimeContainer> {

  final RestTimes _restTimes = RestTimes();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          AppStrings.restContainerTitle,
          style: AppStyles.mainFontSizeStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularPercent(
              currentTime: 'День',
              progressPercentColor: const Color(0xFF5C6BC0),
              percent: _restTimes.getRestDayProgress,
            ),
            CircularPercent(
              currentTime: 'Неделя',
              progressPercentColor: const Color(0xFF009688),
              percent: _restTimes.getRestWeekProgress,
            ),
            CircularPercent(
              currentTime: 'Месяц',
              progressPercentColor: const Color(0xFFFF7043),
              percent: _restTimes.getRestMonthProgress,
            ),
            CircularPercent(
              currentTime: 'Год',
              progressPercentColor: const Color(0xFFAB47BC),
              percent: _restTimes.getRestYearProgress,
            ),
          ],
        )
      ],
    );
  }
}
