import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../state/prayer_state.dart';

class PrayersSchedulePage extends StatefulWidget {
  const PrayersSchedulePage({super.key});

  @override
  State<PrayersSchedulePage> createState() => _PrayersSchedulePageState();
}

class _PrayersSchedulePageState extends State<PrayersSchedulePage> {
  final DateTime _currentDateTime = DateTime.now();
  late final int _daysInMonth;

  @override
  void initState() {
    _daysInMonth = DateTime(_currentDateTime.year, _currentDateTime.month + 1, 0).day;
    super.initState();
  }

  List<PrayerTimes> getPrayerTimesForMonth() {
    List<PrayerTimes> prayerTimesList = [];
    for (int day = 1; day <= _daysInMonth; day++) {
      DateTime currentDate = DateTime(_currentDateTime.year, _currentDateTime.month, day);
      final prayerTimes = Provider.of<PrayerState>(context, listen: false).prayerTimeSchedule(time: currentDate);
      prayerTimesList.add(prayerTimes);
    }
    return prayerTimesList;
  }

  Widget centeredCell(String text, {TextStyle? style, double? width}) {
    return SizedBox(
      width: width,
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: style,
        ),
      ),
    );
  }

  Widget centeredTimeCell(DateTime time, {required bool use24HourFormat, TextStyle? timeStyle, TextStyle? periodStyle, double? width}) {
    final formattedTime = DateFormat(use24HourFormat ? 'HH:mm' : 'hh:mm').format(time);
    final period = use24HourFormat ? '' : DateFormat('a').format(time).toLowerCase();

    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            formattedTime,
            textAlign: TextAlign.center,
            style: timeStyle,
          ),
          if (!use24HourFormat)
            Text(
              period,
              textAlign: TextAlign.center,
              style: periodStyle ??
                  TextStyle(
                    fontSize: 10,
                    color: Colors.grey[600],
                  ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final use24HourFormat = MediaQuery.of(context).alwaysUse24HourFormat;
    final prayerTimesList = getPrayerTimesForMonth();
    final screenWidth = MediaQuery.of(context).size.width;
    final columnWidth = screenWidth / 7;
    final appColors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale.prayerSchedule),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Consumer<PrayerState>(
            builder: (context, prayerState, _) {
              return DataTable(
                headingRowColor: WidgetStateProperty.all(appColors.inversePrimary.withAlpha(75)),
                columnSpacing: 0,
                dataRowMinHeight: 50,
                dataRowMaxHeight: 60,
                columns: [
                  DataColumn(
                    tooltip: appLocale.dayNumber,
                    label: centeredCell(''),
                  ),
                  DataColumn(
                    tooltip: appLocale.fajr,
                    label: centeredCell(appLocale.fajr, width: columnWidth),
                  ),
                  DataColumn(
                    tooltip: appLocale.sunrise,
                    label: centeredCell(appLocale.sunrise, width: columnWidth),
                  ),
                  DataColumn(
                    tooltip: appLocale.dhuhr,
                    label: centeredCell(appLocale.dhuhr, width: columnWidth),
                  ),
                  DataColumn(
                    tooltip: appLocale.asr,
                    label: centeredCell(appLocale.asr, width: columnWidth),
                  ),
                  DataColumn(
                    tooltip: appLocale.maghrib,
                    label: centeredCell(appLocale.maghrib, width: columnWidth),
                  ),
                  DataColumn(
                    tooltip: appLocale.isha,
                    label: centeredCell(appLocale.isha, width: columnWidth),
                  ),
                ],
                rows: List<DataRow>.generate(_daysInMonth, (index) {
                  final prayerTimes = prayerTimesList[index];
                  final day = index + 1;
                  final isToday = day == _currentDateTime.day;

                  final highlightStyle = TextStyle(
                    color: isToday ? appColors.tertiary : appColors.primary,
                    fontWeight: FontWeight.bold,
                  );

                  return DataRow(
                    color: WidgetStateProperty.all(isToday ? appColors.tertiaryContainer : appColors.secondaryContainer.withAlpha(75)),
                    cells: [
                      DataCell(
                        centeredCell(
                          day.toString(),
                          style: TextStyle(
                            fontWeight:
                            isToday ? FontWeight.bold : FontWeight.normal,
                          ),
                          width: columnWidth / 1.75,
                        ),
                      ),
                      DataCell(
                        centeredTimeCell(
                          prayerTimes.fajr,
                          timeStyle: highlightStyle,
                          width: columnWidth,
                          use24HourFormat: use24HourFormat,
                        ),
                      ),
                      DataCell(
                        centeredTimeCell(
                          prayerTimes.sunrise,
                          width: columnWidth,
                          use24HourFormat: use24HourFormat,
                        ),
                      ),
                      DataCell(
                        centeredTimeCell(
                          prayerTimes.dhuhr,
                          timeStyle: highlightStyle,
                          width: columnWidth,
                          use24HourFormat: use24HourFormat,
                        ),
                      ),
                      DataCell(
                        centeredTimeCell(
                          prayerTimes.asr,
                          width: columnWidth,
                          use24HourFormat: use24HourFormat,
                        ),
                      ),
                      DataCell(
                        centeredTimeCell(
                          prayerTimes.maghrib,
                          timeStyle: highlightStyle,
                          width: columnWidth,
                          use24HourFormat: use24HourFormat,
                        ),
                      ),
                      DataCell(
                        centeredTimeCell(
                          prayerTimes.isha,
                          width: columnWidth,
                          use24HourFormat: use24HourFormat,
                        ),
                      ),
                    ],
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
