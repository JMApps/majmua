import 'package:flutter/material.dart';

import '../../../core/styles/app_styles.dart';

class FortressDailyItem extends StatelessWidget {
  const FortressDailyItem({
    super.key,
    required this.iconName,
    required this.title,
    required this.chapterId,
  });

  final String iconName;
  final String title;
  final int chapterId;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          // Navigate with chapter id
        },
        borderRadius: AppStyles.mainBorderMini,
        child: Container(
          padding: AppStyles.mainMarding,
          decoration: BoxDecoration(
            borderRadius: AppStyles.mainBorderMini,
            image: DecorationImage(
              image: AssetImage('assets/pictures/$iconName.jpg'),
              fit: BoxFit.cover,
              opacity: Theme.of(context).brightness == Brightness.light ? 0.65 : 0.35,
            ),
          ),
          child: Text(
            title,
            style: AppStyles.mainTextStyleMiniBold,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
