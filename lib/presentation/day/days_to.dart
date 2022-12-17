import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/presentation/day/days_to_id.dart';

class DaysTo extends StatelessWidget {
  const DaysTo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          DaysToId(
            title: 'До Рамадана',
            numberOfDays: MainAppStyle.getToRamadanDays(),
            color: Colors.indigo,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: DaysToId(
              title: 'До Курбан-Байрама',
              numberOfDays: MainAppStyle.getToQurbanDays(),
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}
