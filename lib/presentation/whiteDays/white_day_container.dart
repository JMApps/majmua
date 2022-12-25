import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/presentation/restTime/rest_times.dart';
import 'package:majmua/presentation/whiteDays/white_day_item.dart';

class WhiteDayContainer extends StatefulWidget {
  const WhiteDayContainer({Key? key}) : super(key: key);

  @override
  State<WhiteDayContainer> createState() => _WhiteDayContainerState();
}

class _WhiteDayContainerState extends State<WhiteDayContainer> {
  final RestTimes _restTimes = RestTimes();

  @override
  Widget build(BuildContext context) {
    return _restTimes.dateTimeHijri.hDay >= 12 &&
            _restTimes.dateTimeHijri.hDay <= 15
        ? Column(
            children: [
              const SizedBox(height: 4),
              Card(
                elevation: 0,
                margin: AppStyles.symmetricHorizontalMarginMini,
                shape: AppStyles.mainCardBorderRadius,
                child: Padding(
                  padding: AppStyles.mainPaddingMini,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _restTimes.dateTimeHijri.hDay == 12
                          ? const Text(
                              'Приблизилсь белые дни ',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            )
                          : const Text(
                              'Пост в белые дни ',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                      WhiteDayItem(
                        hijriMonthDay: _restTimes.dateTimeHijri.hDay,
                        whiteDay: 13,
                      ),
                      WhiteDayItem(
                        hijriMonthDay: _restTimes.dateTimeHijri.hDay,
                        whiteDay: 14,
                      ),
                      WhiteDayItem(
                        hijriMonthDay: _restTimes.dateTimeHijri.hDay,
                        whiteDay: 15,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 4),
              const Divider(indent: 16, endIndent: 16),
            ],
          )
        : const SizedBox();
  }
}
