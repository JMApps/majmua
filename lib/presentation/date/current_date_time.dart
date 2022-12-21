import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/presentation/date/current_date_tile.dart';

class CurrentDateTime extends StatelessWidget {
  const CurrentDateTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: MainAppStyle.mainPaddingMini,
              decoration: const BoxDecoration(
                borderRadius: MainAppStyle.mainBorderRadius,
                color: Colors.white,
              ),
              constraints: const BoxConstraints(
                minHeight: 115,
                maxHeight: 115,
              ),
              alignment: Alignment.center,
              child: Wrap(
                children: [
                  CurrentDateTile(
                    currentYear: MainAppStyle.dateTime.year,
                    currentMonth: MainAppStyle.getMonthNames,
                    currentDay: MainAppStyle.dateTime.day,
                    color: Colors.indigo,
                  ),
                  CurrentDateTile(
                    currentYear: MainAppStyle.dateTimeHijri.hYear,
                    currentMonth: MainAppStyle.getMonthHijriNames,
                    currentDay: MainAppStyle.dateTimeHijri.hDay,
                    color: Colors.teal,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Container(
                  padding: MainAppStyle.mainPaddingMini,
                  decoration: BoxDecoration(
                    borderRadius: MainAppStyle.mainBorderRadius,
                    color: Colors.primaries[MainAppStyle.dateTime.weekday].shade100,
                    border: Border.all(
                        color: Colors.primaries[MainAppStyle.dateTime.weekday].shade900),
                  ),
                  constraints: const BoxConstraints(
                    minHeight: 37,
                    maxHeight: 37,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    MainAppStyle.getNamesWeekDay,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors
                          .primaries[MainAppStyle.dateTime.weekday].shade900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: MainAppStyle.mainBorderRadius,
                    color: Colors.white,
                  ),
                  constraints: const BoxConstraints(
                    minHeight: 70,
                    maxHeight: 70,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    MainAppStyle.getMessagesForSaum,
                    style: TextStyle(
                      fontSize: MainAppStyle.dateTime.weekday == 5 ? 40 : 14,
                      color: Colors.teal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
