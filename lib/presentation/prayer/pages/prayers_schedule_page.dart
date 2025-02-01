import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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

  List<PrayerTimes> getPrayerTimesForWeek() {
    List<PrayerTimes> prayerTimesList = [];
    for (int day = 1; day <= _daysInMonth; day++) {
      DateTime currentDate = DateTime(_currentDateTime.year, _currentDateTime.month, day);
      final prayerTimes = Provider.of<PrayerState>(context, listen: false).prayerTimeSchedule(time: currentDate);
      prayerTimesList.add(prayerTimes);
    }

    return prayerTimesList;
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final prayerTimesList = getPrayerTimesForWeek();
    final screenWidth = MediaQuery.of(context).size.width;
    final columnWidth = screenWidth / 7;
    final appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale.prayerSchedule),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: DataTable(
            headingRowColor: WidgetStateProperty.all(appColors.inversePrimary.withAlpha(75)),
            columnSpacing: 0,
            dataRowHeight: 35.0,
            columns: [
              DataColumn(
                tooltip: appLocale.dayNumber,
                label: SizedBox(
                  width: columnWidth / 1.75,
                  child: const Text(''),
                ),
              ),
              DataColumn(
                tooltip: appLocale.fajr,
                label: SizedBox(
                  width: columnWidth,
                  child: Text(appLocale.fajr),
                ),
              ),
              DataColumn(
                tooltip: appLocale.sunrise,
                label: SizedBox(
                  width: columnWidth,
                  child: Text(appLocale.sunrise),
                ),
              ),
              DataColumn(
                tooltip: appLocale.dhuhr,
                label: SizedBox(
                  width: columnWidth,
                  child: Text(appLocale.dhuhr),
                ),
              ),
              DataColumn(
                tooltip: appLocale.asr,
                label: SizedBox(
                  width: columnWidth,
                  child: Text(appLocale.asr),
                ),
              ),
              DataColumn(
                tooltip: appLocale.maghrib,
                label: SizedBox(
                  width: columnWidth,
                  child: Text(appLocale.maghrib),
                ),
              ),
              DataColumn(
                tooltip: appLocale.isha,
                label: SizedBox(
                  width: columnWidth,
                  child: Text(appLocale.isha),
                ),
              ),
            ],
            rows: prayerTimesList.map((prayerTimes) {
              final dayIndex = prayerTimesList.indexOf(prayerTimes);
              return DataRow(
                color: WidgetStateProperty.all(
                  dayIndex + 1 == _currentDateTime.day ? appColors.tertiaryContainer : appColors.secondaryContainer.withAlpha(75),
                ),
                cells: [
                  DataCell(
                    SizedBox(
                      width: columnWidth / 1.75,
                      child: Text(
                        (dayIndex + 1).toString(),
                        style: TextStyle(
                          fontWeight: dayIndex + 1 == _currentDateTime.day ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    SizedBox(
                      width: columnWidth,
                      child: Text(
                        DateFormat('HH:mm').format(prayerTimes.fajr),
                        style: TextStyle(
                          color: dayIndex + 1 == _currentDateTime.day ? appColors.tertiary : appColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    SizedBox(
                      width: columnWidth,
                      child: Text(
                        DateFormat('HH:mm').format(prayerTimes.sunrise),
                      ),
                    ),
                  ),
                  DataCell(
                    SizedBox(
                      width: columnWidth,
                      child: Text(
                        DateFormat('HH:mm').format(prayerTimes.dhuhr),
                        style: TextStyle(
                          color: dayIndex + 1 == _currentDateTime.day ? appColors.tertiary : appColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    SizedBox(
                      width: columnWidth,
                      child: Text(
                        DateFormat('HH:mm').format(prayerTimes.asr),
                      ),
                    ),
                  ),
                  DataCell(
                    SizedBox(
                      width: columnWidth,
                      child: Text(
                        DateFormat('HH:mm').format(prayerTimes.maghrib),
                        style: TextStyle(
                          color: dayIndex + 1 == _currentDateTime.day ? appColors.tertiary : appColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    SizedBox(
                      width: columnWidth,
                      child: Text(
                        DateFormat('HH:mm').format(prayerTimes.isha),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
