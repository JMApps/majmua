import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/presentation/whiteSaum/white_day_circle.dart';

class WhiteSaumContainer extends StatelessWidget {
  const WhiteSaumContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: MainAppStyle.mainPaddingMini,
      margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
      decoration: const BoxDecoration(
        borderRadius: MainAppStyle.mainBorderRadius,
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MainAppStyle.dateTimeHijri.hDay == 12
              ? const Text(
                  'Завтра белые дни',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )
              : const Text(
                  'Пост в белые дни',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
          WhiteDayCircle(
            currentHijriDay: MainAppStyle.dateTimeHijri.hDay,
            whiteDay: 13,
          ),
          WhiteDayCircle(
            currentHijriDay: MainAppStyle.dateTimeHijri.hDay,
            whiteDay: 14,
          ),
          WhiteDayCircle(
            currentHijriDay: MainAppStyle.dateTimeHijri.hDay,
            whiteDay: 15,
          ),
        ],
      ),
    );
  }
}
