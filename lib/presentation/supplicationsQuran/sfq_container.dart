import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';

class SFQContainer extends StatelessWidget {
  const SFQContainer({Key? key}) : super(key: key);

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
            opacity: 0.60,
            fit: BoxFit.cover,
            image: AssetImage('assets/images/supplication.png'),
          ),
        ),
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(context, 'sfq_page');
          },
          shape: AppStyles.mainCardBorderRadius,
          visualDensity: const VisualDensity(vertical: -2),
          contentPadding: AppStyles.symmetricHorizontalPadding,
          title: Text(
            'Мольбы из Корана',
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
