import 'package:flutter/material.dart';

import '../../../core/styles/app_styles.dart';

class PrayerParamsDescriptionText extends StatelessWidget {
  const PrayerParamsDescriptionText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text:',
      style: AppStyles.mainTextStyleBold,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
    );
  }
}
