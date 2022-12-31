import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
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
    final appColors = Theme.of(context).colorScheme;
    return Card(
      elevation: 1,
      shape: AppStyles.mainCardBorderRadius,
      margin: AppStyles.symmetricHorizontalMarginMini,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppStyles.mainBorderRadius,
          image: DecorationImage(
            opacity: Theme.of(context).brightness == Brightness.light ? 0.150 : 0.075,
            fit: BoxFit.fitWidth,
            colorFilter: ColorFilter.mode(
              appColors.mainTextColor,
              Theme.of(context).brightness == Brightness.light
                  ? BlendMode.dst
                  : BlendMode.srcIn,
            ),
            image: const AssetImage('assets/images/abstract_time.png'),
          ),
        ),
        padding: AppStyles.mainPaddingMini,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.restContainerTitle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: appColors.mainTextColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: appColors.restTimeCircleAvatarColor,
                  radius: 40,
                  child: CircularPercent(
                    currentPeriod: 'День',
                    progressPercentColor: const Color(0xFF3F51B5),
                    percent: _restTimes.getRestDayProgress,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: appColors.restTimeCircleAvatarColor,
                  radius: 40,
                  child: CircularPercent(
                    currentPeriod: 'Неделя',
                    progressPercentColor: const Color(0xFF009688),
                    percent: _restTimes.getRestWeekProgress,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: appColors.restTimeCircleAvatarColor,
                  radius: 40,
                  child: CircularPercent(
                    currentPeriod: 'Месяц',
                    progressPercentColor: const Color(0xFFFF7043),
                    percent: _restTimes.getRestMonthProgress,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: appColors.restTimeCircleAvatarColor,
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
