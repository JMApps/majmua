import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';

class LibraryContainer extends StatelessWidget {
  const LibraryContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      elevation: 1,
      shape: AppStyles.mainCardBorderRadius,
      margin: AppStyles.symmetricHorizontalMarginMini,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppStyles.mainBorderRadius,
          image: DecorationImage(
            opacity: Theme.of(context).brightness == Brightness.light ? 0.75 : 0.100,
            fit: BoxFit.cover,
            image: const AssetImage('assets/images/books.png'),
          ),
        ),
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(context, 'library_page');
          },
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
