import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/presentation/restTime/rest_times.dart';

class BeforeHolidaysContainer extends StatefulWidget {
  const BeforeHolidaysContainer({Key? key}) : super(key: key);

  @override
  State<BeforeHolidaysContainer> createState() =>
      _BeforeHolidaysContainerState();
}

class _BeforeHolidaysContainerState extends State<BeforeHolidaysContainer> {
  final RestTimes _restTimes = RestTimes();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: AppStyles.symmetricHorizontalMarginMini,
      padding: AppStyles.mainPaddingMini,
      decoration: const BoxDecoration(
        borderRadius: AppStyles.mainBorderRadius,
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'До Рамадана:',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          CircleAvatar(
            radius: 17.5,
            backgroundColor: Colors.teal,
            child: Text(
              _restTimes.getToRamadanDays.toString().substring(1),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
          const Text(
            'До Курбан-Байрама:',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          CircleAvatar(
            radius: 17.5,
            child: Text(
              _restTimes.getToQurbanDays.toString().substring(1),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
