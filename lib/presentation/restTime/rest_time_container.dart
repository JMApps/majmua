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
    return Card(
      elevation: 1,
      color: Colors.white,
      shape: AppStyles.mainCardBorderRadius,
      margin: AppStyles.symmetricHorizontalMarginMini,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: AppStyles.mainBorderRadius,
          image: DecorationImage(
            opacity: 0.150,
            fit: BoxFit.none,
            image: AssetImage('assets/images/abstract_time.png'),
          ),
        ),
        padding: AppStyles.mainPaddingMini,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppStrings.restContainerTitle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  child: CircularPercent(
                    currentPeriod: 'День',
                    progressPercentColor: const Color(0xFF5C6BC0),
                    percent: _restTimes.getRestDayProgress,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  child: CircularPercent(
                    currentPeriod: 'Неделя',
                    progressPercentColor: const Color(0xFF009688),
                    percent: _restTimes.getRestWeekProgress,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  child: CircularPercent(
                    currentPeriod: 'Месяц',
                    progressPercentColor: const Color(0xFFFF7043),
                    percent: _restTimes.getRestMonthProgress,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  child: CircularPercent(
                    currentPeriod: 'Год',
                    progressPercentColor: const Color(0xFFAB47BC),
                    percent: _restTimes.getRestYearProgress,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
