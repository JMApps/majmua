import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';

class ColumnItem extends StatelessWidget {
  const ColumnItem({
    Key? key,
    required this.title,
    required this.isLeft,
    required this.routeName,
    required this.imageName,
  }) : super(key: key);

  final String title;
  final bool isLeft;
  final String routeName;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      elevation: 1,
      margin: EdgeInsets.zero,
      shape: isLeft
          ? AppStyles.leftCardBorderRadius
          : AppStyles.rightCardBorderRadius,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        borderRadius: isLeft ? AppStyles.leftBorderRadius : AppStyles.rightBorderRadius,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: isLeft
                ? AppStyles.leftBorderRadius
                : AppStyles.rightBorderRadius,
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              opacity: Theme.of(context).brightness == Brightness.light
                  ? 0.75
                  : 0.100,
              image: AssetImage('assets/images/$imageName'),
            ),
          ),
          padding: AppStyles.mainPaddingMini,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: appColors.mainTextColor,
              shadows: [
                Shadow(
                  color: appColors.mainTextColor,
                  blurRadius: 0.5,
                )
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
