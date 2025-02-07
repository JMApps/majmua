import 'package:flutter/material.dart';

import '../../../core/styles/app_styles.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.title,
    required this.switchState,
    required this.onChanged,
  });

  final String title;
  final bool switchState;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      visualDensity: VisualDensity.compact,
      contentPadding: AppStyles.mardingHorizontalMini,
      shape: AppStyles.mainShapeMini,
      title: Text(
        title,
        style: AppStyles.mainTextStyleMini,
      ),
      value: switchState,
      onChanged: onChanged,
    );
  }
}
