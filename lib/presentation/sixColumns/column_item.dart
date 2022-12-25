import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';

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
    return Card(
      elevation: 1,
      margin: EdgeInsets.zero,
      shape: isLeft
          ? AppStyles.leftCardBorderRadius
          : AppStyles.rightCardBorderRadius,
      child: InkWell(
        onTap: () {},
        borderRadius: isLeft ? AppStyles.leftBorderRadius : AppStyles.rightBorderRadius,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: isLeft ? AppStyles.leftBorderRadius : AppStyles.rightBorderRadius,
          ),
          padding: AppStyles.mainPadding,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
