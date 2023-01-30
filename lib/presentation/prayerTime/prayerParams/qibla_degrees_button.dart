import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/prayerTime/prayerParams/qibla_compass.dart';

class QiblaDegreesButton extends StatelessWidget {
  const QiblaDegreesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).colorScheme;
    return MaterialButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (_) => const QiblaCompass(),
        );
      },
      shape: AppWidgetStyle.mainRectangleBorderMini,
      color: appColor.firstAppColor,
      child: const Text(
        AppString.qiblaDegrees,
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
        ),
      ),
    );
  }
}
