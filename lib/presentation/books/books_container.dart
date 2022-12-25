import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';

class BooksContainer extends StatelessWidget {
  const BooksContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      shape: AppStyles.mainCardBorderRadius,
      margin: AppStyles.symmetricHorizontalMarginMini,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: AppStyles.mainBorderRadius,
          image: DecorationImage(
            opacity: 0.50,
            fit: BoxFit.cover,
            image: AssetImage('assets/images/books.png'),
          ),
        ),
        child: ListTile(
          onTap: () {},
          shape: AppStyles.mainCardBorderRadius,
          visualDensity: const VisualDensity(vertical: -2),
          contentPadding: AppStyles.symmetricHorizontalPadding,
          title: Text(
            'Библиотека',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: appColors.mainTextColor,
              shadows: [
                Shadow(
                  color: appColors.firstAppColor,
                  blurRadius: 0.5,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
