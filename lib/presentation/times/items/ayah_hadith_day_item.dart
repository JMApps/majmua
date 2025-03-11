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
      padding: EdgeInsets.zero,
      child: Container(
        height: 115,
        alignment: Alignment.center,
        padding: AppStyles.mainMarding,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/icons/circle.png'),
            colorFilter: ColorFilter.mode(appColors.tertiary, BlendMode.srcATop)
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: appColors.secondary,
            fontFamily: AppStringConstraints.fontGilroyMedium,
            height: 1.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
