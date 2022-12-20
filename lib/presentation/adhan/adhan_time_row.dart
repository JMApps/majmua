import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:majmua/presentation/adhan/adhan_item.dart';

class AdhanTimeRow extends StatefulWidget {
  const AdhanTimeRow({Key? key}) : super(key: key);

  @override
  State<AdhanTimeRow> createState() => _AdhanTimeRowState();
}

class _AdhanTimeRowState extends State<AdhanTimeRow> {
  late final PrayerTimes prayerTimes;

  @override
  void initState() {
    final myCoordinates = Coordinates(36.263587562315955, 36.57045147256616);
    final params = CalculationMethod.north_america.getParameters();
    prayerTimes = PrayerTimes.today(myCoordinates, params);
    super.initState();
    daysBetween(DateTime.now(), DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Divider(indent: 8, endIndent: 8),
          const Text(
            'Сирия, Харим',
            textAlign: TextAlign.center,
          ),
          const Divider(indent: 8, endIndent: 8),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AdhanItem(
                prayerName: 'Фаджр',
                prayerHour: '${prayerTimes.fajr.hour}',
                prayerMinute: '${prayerTimes.fajr.minute}',
              ),
              AdhanItem(
                prayerName: 'Рассвет',
                prayerHour: '${prayerTimes.sunrise.hour}',
                prayerMinute: '${prayerTimes.sunrise.minute}',
              ),
              AdhanItem(
                prayerName: 'Зухр',
                prayerHour: '${prayerTimes.dhuhr.hour}',
                prayerMinute: '${prayerTimes.dhuhr.minute}',
              ),
              AdhanItem(
                prayerName: 'Аср',
                prayerHour: '${prayerTimes.asr.hour}',
                prayerMinute: '${prayerTimes.asr.minute}',
              ),
              AdhanItem(
                prayerName: 'Магриб',
                prayerHour: '${prayerTimes.maghrib.hour}',
                prayerMinute: '${prayerTimes.maghrib.minute}',
              ),
              AdhanItem(
                prayerName: 'Иша',
                prayerHour: '${prayerTimes.isha.hour}',
                prayerMinute: '${prayerTimes.isha.minute}',
              ),
            ],
          ),
          const Divider(indent: 8, endIndent: 8),
          Text('Последний час пятницы: ${prayerTimes.maghrib.hour - 1}:${prayerTimes.maghrib.minute}'),
          const Divider(indent: 8, endIndent: 8),
        ],
      ),
    );
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day, prayerTimes.fajr.hour, prayerTimes.fajr.minute);
    to = DateTime(to.year, to.month, to.day, prayerTimes.maghrib.hour, prayerTimes.maghrib.minute);
    print(to.difference(from).inMinutes);
    return to.difference(from).inMinutes;
  }
}
