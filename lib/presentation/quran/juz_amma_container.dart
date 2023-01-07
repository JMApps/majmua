import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';

class JuzAmmaContainer extends StatelessWidget {
  const JuzAmmaContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      shape: AppStyles.mainCardBorderRadius,
      margin: AppStyles.symmetricHorizontalMarginMini,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppStyles.mainBorderRadius,
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity:
                Theme.of(context).brightness == Brightness.light ? 0.25 : 0.100,
            image: const AssetImage('assets/images/ammajuz.png'),
          ),
        ),
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(context, 'juz_amma_page');
          },
          shape: AppStyles.mainCardBorderRadius,
          visualDensity: const VisualDensity(vertical: -2),
          contentPadding: AppStyles.symmetricHorizontalPadding,
          title: Text(
            '30 джуз',
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
