import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';

class AdhanItem extends StatefulWidget {
  const AdhanItem({
    Key? key,
    required this.prayerName,
    required this.prayerHour,
    required this.prayerMinute,
    required this.setFirstTimeValue,
    required this.getFirstTimeValue,
    required this.setNextTimeValue,
    required this.getNextTimeValue,
    required this.pastAdhanTime,
    required this.futureAdhanTime,
  }) : super(key: key);

  final String prayerName;
  final String prayerHour;
  final String prayerMinute;
  final int setFirstTimeValue;
  final int getFirstTimeValue;
  final int setNextTimeValue;
  final int getNextTimeValue;
  final DateTime pastAdhanTime;
  final DateTime futureAdhanTime;

  @override
  State<AdhanItem> createState() => _AdhanItemState();
}

class _AdhanItemState extends State<AdhanItem> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.prayerName,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 40,
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            color: MainAppStyle.getMinuteOfDay > widget.getFirstTimeValue && MainAppStyle.getMinuteOfDay < widget.getNextTimeValue ? Colors.orange : Colors.teal,
          ),
          child: Text(
            widget.prayerHour,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 40,
          height: 35,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            color: Colors.indigo,
          ),
          child: Text(
            widget.prayerMinute,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
