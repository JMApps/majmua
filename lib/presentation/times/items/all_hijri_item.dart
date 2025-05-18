import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/styles/app_styles.dart';

class AllHijriItem extends StatelessWidget {
  const AllHijriItem({
    super.key,
    required this.eventName,
    required this.eventDate,
    required this.remindDays,
    required this.circleNumber,
  });

  final String eventName;
  final DateTime eventDate;
  final int remindDays;
  final int circleNumber;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        eventName,
        style: AppStyles.mainTextStyleMiniBold,
      ),
      subtitle: Text(
        DateFormat('dd.MM.yyyy').format(eventDate),
        style: TextStyle(
          color: appColors.primary,
        ),
      ),
      leading: CircleAvatar(
        backgroundColor: appColors.primaryContainer,
        child: Padding(
          padding: AppStyles.mardingTopMicroMini,
          child: Text('$circleNumber'),
        ),
      ),
      trailing: Visibility(
        visible: remindDays != 0,
        child: Container(
          padding: AppStyles.mainMardingMicro,
          width: 75,
          decoration: BoxDecoration(
            color: appColors.tertiaryContainer,
            borderRadius: AppStyles.mainBorderMini,
          ),
          child: Text(
            '-$remindDays',
            style: TextStyle(
              fontSize: 16.0,
              color: appColors.tertiary,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
