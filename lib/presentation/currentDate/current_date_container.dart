import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/presentation/currentDate/current_date_item.dart';
import 'package:majmua/presentation/restTime/rest_times.dart';

class CurrentDateContainer extends StatefulWidget {
  const CurrentDateContainer({Key? key}) : super(key: key);

  @override
  State<CurrentDateContainer> createState() => _CurrentDateContainerState();
}

class _CurrentDateContainerState extends State<CurrentDateContainer> {
  final RestTimes _restTimes = RestTimes();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        Expanded(
          flex: 3,
          child: Card(
            elevation: 1,
            margin: EdgeInsets.zero,
            shape: AppStyles.mainCardBorderRadius,
            child: Container(
              padding: AppStyles.mainPaddingMini,
              decoration: const BoxDecoration(
                borderRadius: AppStyles.mainBorderRadius,
                color: Colors.white,
              ),
              constraints: const BoxConstraints(
                minWidth: 110,
                maxHeight: 110,
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CurrentDateItem(
                    currentMonth: _restTimes.getMonthName,
                    currentYear: _restTimes.dateTime.year,
                    currentDay: _restTimes.dateTime.day,
                    color: Colors.indigo,
                  ),
                  CurrentDateItem(
                    currentMonth: _restTimes.getMonthHijriName,
                    currentYear: _restTimes.dateTimeHijri.hYear,
                    currentDay: _restTimes.dateTimeHijri.hDay,
                    color: Colors.teal,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: AppStyles.mainBorderRadius,
                  color: Colors.white,
                  border: Border.all(
                    color: _restTimes.dateTime.weekday == 5 ? Colors.deepOrange : Colors.teal,
                    width: 1,
                  ),
                ),
                constraints: const BoxConstraints(
                  minWidth: 35,
                  maxHeight: 35,
                ),
                alignment: Alignment.center,
                child: Text(
                  _restTimes.getNameWeekDay,
                  style: TextStyle(
                    fontSize: 16,
                    color: _restTimes.dateTime.weekday == 5 ? Colors.deepOrange : Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: AppStyles.mainPaddingMini,
                decoration: const BoxDecoration(
                  borderRadius: AppStyles.mainBorderRadius,
                  color: Colors.white,
                ),
                constraints: const BoxConstraints(
                  minWidth: 67,
                  maxHeight: 67,
                ),
                alignment: Alignment.center,
                child: Text(
                  _restTimes.getMessageForSaum,
                  style: TextStyle(
                    fontSize: _restTimes.dateTime.weekday == 5 ? 40 : 14,
                    color: _restTimes.dateTime.weekday == 5 ? Colors.indigo : Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
