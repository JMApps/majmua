import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/presentation/day/days_to_id.dart';

class DaysTo extends StatelessWidget {
  const DaysTo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DaysToId(
          title: 'Осталось дней до Рамадана',
          numberOfDays: MainAppStyle.getToRamadanDays(),
          color: Colors.indigo,
        ),
        const SizedBox(height: 8),
        DaysToId(
          title: 'Осталось дней до Курбан-Байрама',
          numberOfDays: MainAppStyle.getToQurbanDays(),
          color: Colors.teal,
        ),
      ],
    );
  }
}
