import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';

class PrayerSettings extends StatelessWidget {
  const PrayerSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: AppStyles.mainMargin,
      shape: AppStyles.mainCardBorderRadius,
      child: Text('Prayer settings'),
    );
  }
}
