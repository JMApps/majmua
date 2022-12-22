import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:majmua/application/style/app_styles.dart';

class ForLastTimes extends StatelessWidget {
  const ForLastTimes({
    Key? key,
    required this.title,
    required this.lastDateTime,
  }) : super(key: key);

  final String title;
  final DateTime lastDateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        borderRadius: AppStyles.mainBorderRadius,
        color: Colors.white,
      ),
      child: Text('$title: ${DateFormat.Hm().format(lastDateTime)}'),
    );
  }
}
