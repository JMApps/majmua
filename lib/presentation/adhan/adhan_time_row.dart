import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:majmua/presentation/adhan/adhan_item.dart';
import 'package:majmua/presentation/adhan/prayer_time.dart';

class AdhanTimeRow extends StatefulWidget {
  const AdhanTimeRow({Key? key}) : super(key: key);

  @override
  State<AdhanTimeRow> createState() => _AdhanTimeRowState();
}

class _AdhanTimeRowState extends State<AdhanTimeRow> {
  final PrayerTime _prayerTime = PrayerTime();

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
                prayerHour: '${_prayerTime.getFajrTime.hour}',
                prayerMinute: '${_prayerTime.getFajrTime.minute}',
                setFirstTimeValue: _prayerTime.setCurrentValue = 0,
                getFirstTimeValue: _prayerTime.getCurrentValue,
                setNextTimeValue: _prayerTime.setCurrentValue = 1,
                getNextTimeValue: _prayerTime.getCurrentValue,
              ),
              AdhanItem(
                prayerName: 'Рассвет',
                prayerHour: '${_prayerTime.getSunriseTime.hour}',
                prayerMinute: '${_prayerTime.getSunriseTime.minute}',
                setFirstTimeValue: _prayerTime.setCurrentValue = 2,
                getFirstTimeValue: _prayerTime.getCurrentValue,
                setNextTimeValue: _prayerTime.setCurrentValue = 3,
                getNextTimeValue: _prayerTime.getCurrentValue,
              ),
              AdhanItem(
                prayerName: 'Зухр',
                prayerHour: '${_prayerTime.getDhuhrTime.hour}',
                prayerMinute: '${_prayerTime.getDhuhrTime.minute}',
                setFirstTimeValue: _prayerTime.setCurrentValue = 3,
                getFirstTimeValue: _prayerTime.getCurrentValue,
                setNextTimeValue: _prayerTime.setCurrentValue = 4,
                getNextTimeValue: _prayerTime.getCurrentValue,
              ),
              AdhanItem(
                prayerName: 'Аср',
                prayerHour: '${_prayerTime.getAsrTime.hour}',
                prayerMinute: '${_prayerTime.getAsrTime.minute}',
                setFirstTimeValue: _prayerTime.setCurrentValue = 4,
                getFirstTimeValue: _prayerTime.getCurrentValue,
                setNextTimeValue: _prayerTime.setCurrentValue = 5,
                getNextTimeValue: _prayerTime.getCurrentValue,
              ),
              AdhanItem(
                prayerName: 'Магриб',
                prayerHour: '${_prayerTime.getMaghribTime.hour}',
                prayerMinute: '${_prayerTime.getMaghribTime.minute}',
                setFirstTimeValue: _prayerTime.setCurrentValue = 5,
                getFirstTimeValue: _prayerTime.getCurrentValue,
                setNextTimeValue: _prayerTime.setCurrentValue = 6,
                getNextTimeValue: _prayerTime.getCurrentValue,
              ),
              AdhanItem(
                prayerName: 'Иша',
                prayerHour: '${_prayerTime.getIshaTime.hour}',
                prayerMinute: '${_prayerTime.getIshaTime.minute}',
                setFirstTimeValue: _prayerTime.setCurrentValue = 6,
                getFirstTimeValue: _prayerTime.getCurrentValue,
                setNextTimeValue: _prayerTime.setCurrentValue = 7,
                getNextTimeValue: _prayerTime.getCurrentValue,
              ),
            ],
          ),
          const Divider(indent: 8, endIndent: 8),
          Text('Последняя треть ночи: ${DateFormat.Hm().format(_prayerTime.getThirdNightPart)}'),
          const Divider(indent: 8, endIndent: 8),
          Text('Последний час пятницы: ${DateFormat.Hm().format(_prayerTime.getLastHourFriday)}'),
          const Divider(indent: 8, endIndent: 8),
        ],
      ),
    );
  }
}
