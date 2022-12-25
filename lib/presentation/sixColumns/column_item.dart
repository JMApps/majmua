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
        borderRadius:
            isLeft ? AppStyles.leftBorderRadius : AppStyles.rightBorderRadius,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: isLeft
                ? AppStyles.leftBorderRadius
                : AppStyles.rightBorderRadius,
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              opacity: 0.75,
              image: AssetImage('assets/images/$imageName'),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              shadows: [
                Shadow(
                  color: Colors.indigo,
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
