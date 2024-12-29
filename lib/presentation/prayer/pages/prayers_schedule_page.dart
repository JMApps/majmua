import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class PrayersSchedulePage extends StatefulWidget {
  const PrayersSchedulePage({super.key});

  @override
  State<PrayersSchedulePage> createState() => _PrayersSchedulePageState();
}

class _PrayersSchedulePageState extends State<PrayersSchedulePage> {
  List<PrayerTimes> getPrayerTimesForWeek() {
    List<PrayerTimes> prayerTimesList = [];

    for (int i = 0; i < 30; i++) {
      final newYork = Coordinates(35.7750, -78.6336);
      final nyDate = DateComponents(2024, 12, i);
      final nyParams = CalculationMethod.muslim_world_league.getParameters();
      nyParams.madhab = Madhab.shafi;
      final prayerTimes = PrayerTimes(newYork, nyDate, nyParams, utcOffset: Duration(hours: -5));
      prayerTimesList.add(prayerTimes);
    }

    return prayerTimesList;
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final prayerTimesList = getPrayerTimesForWeek();
    final screenWidth = MediaQuery.of(context).size.width;
    const columnCount = 7;
    final columnWidth = screenWidth / columnCount;
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale.prayerSchedule),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: DataTable(
            horizontalMargin: 8,
            columnSpacing: 0,
            columns: [
              DataColumn(
                label: Text(appLocale.fajr),
              ),
              DataColumn(
                label: Text(appLocale.fajr),
              ),
              DataColumn(
                label: Text(appLocale.sunrise),
              ),
              DataColumn(
                label: Text(appLocale.dhuhr),
              ),
              DataColumn(
                label: Text(appLocale.asr),
              ),
              DataColumn(
                label: Text(appLocale.maghrib),
              ),
              DataColumn(
                label: Text(appLocale.isha),
              ),
            ],
            rows: prayerTimesList.map((prayerTimes) {
              final dayIndex = prayerTimesList.indexOf(prayerTimes);
              return DataRow(
                cells: [
                  DataCell(
                    SizedBox(
                      width: columnWidth,
                      child: Text('${dayIndex + 1}'),
                    ),
                  ),
                  DataCell(
                    SizedBox(
                      width: columnWidth,
                      child: Text(
                        DateFormat('HH:mm').format(prayerTimes.fajr),
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
