import 'package:flutter/material.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';

class PrayerTimeInfoButton extends StatelessWidget {
  const PrayerTimeInfoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).colorScheme;
    return MaterialButton(
      onPressed: () {},
      shape: AppWidgetStyle.mainRectangleBorderMini,
      color: appColor.firstAppColor,
      child: const Text(
        'Информация',
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
        ),
      ),
    );
  }
}
