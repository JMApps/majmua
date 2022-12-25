import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/presentation/restTime/rest_times.dart';

class RestHolidaysContainer extends StatefulWidget {
  const RestHolidaysContainer({Key? key}) : super(key: key);

  @override
  State<RestHolidaysContainer> createState() => _RestHolidaysContainerState();
}

class _RestHolidaysContainerState extends State<RestHolidaysContainer> {
  final RestTimes _restTimes = RestTimes();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 4),
        Card(
          elevation: 1,
          margin: AppStyles.symmetricHorizontalMarginMini,
          shape: AppStyles.mainCardBorderRadius,
          child: ListTile(
            visualDensity: const VisualDensity(vertical: -2),
            contentPadding: AppStyles.symmetricHorizontalPadding,
            title: const Text('Осталось дней до Рамадана'),
            trailing: CircleAvatar(
              backgroundColor: Colors.teal,
              radius: 17.5,
              child: Text(
                _restTimes.getToRamadanDays.toString().substring(1),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          elevation: 1,
          margin: AppStyles.symmetricHorizontalMarginMini,
          shape: AppStyles.mainCardBorderRadius,
          child: ListTile(
            visualDensity: const VisualDensity(vertical: -2),
            contentPadding: AppStyles.symmetricHorizontalPadding,
            title: const Text('Осталось дней до Ид аль-Адха'),
            trailing: CircleAvatar(
              backgroundColor: Colors.indigo,
              radius: 17.5,
              child: Text(
                _restTimes.getToQurbanDays.toString().substring(1),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
