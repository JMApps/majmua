import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';

class AyahHadithDayItem extends StatelessWidget {
  const AyahHadithDayItem({
    super.key,
    required this.title,
    required this.color,
    required this.onTap,
  });

  final String title;
  final Color color;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return CupertinoButton(
      onPressed: () {},
      padding: AppStyles.mardingRightMini,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: AppStyles.mainBorderMini,
          border: Border.all(
            width: 1.75,
            color: color,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: appColors.secondary,
            fontSize: 12.0,
            fontFamily: AppStringConstraints.fontGilroyMedium,
            height: 1.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
