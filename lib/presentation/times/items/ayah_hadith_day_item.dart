import 'package:flutter/material.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';

class AyahHadithDayItem extends StatelessWidget {
  const AyahHadithDayItem({
    super.key,
    required this.title,
    required this.color,
    required this.textColor,
    required this.onTap,
  });

  final String title;
  final Color color;
  final Color textColor;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: AppStyles.mardingRightMini,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppStyles.mainBorderMini,
        splashColor: color,
        highlightColor: color,
        child: Padding(
          padding: AppStyles.mainMardingMicroMini,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: AppStyles.mainBorderMini,
              border: Border.all(
                width: 1.5,
                color: textColor,
              )
            ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12.0,
                color: textColor,
                fontFamily: AppStringConstraints.fontGilroyMedium,
                height: 1.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
