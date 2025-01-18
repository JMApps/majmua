import 'package:flutter/material.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';

class AyahHadithDayItem extends StatelessWidget {
  const AyahHadithDayItem({
    super.key,
    required this.iconName,
    required this.title,
    required this.color,
    required this.onTap,
  });

  final String iconName;
  final String title;
  final Color color;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: AppStyles.mardingRightMini,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppStyles.mainBorderMini,
        splashColor: color.withAlpha(155),
        highlightColor: color,
        child: Container(
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: AppStyles.mainBorderMini,
            border: Border.all(
              width: 2.5,
              color: color,
            ),
            image: DecorationImage(
              image: AssetImage('assets/icons/$iconName.png'),
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14.0,
              fontFamily: AppStringConstraints.fontGilroyMedium,
              height: 1.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
