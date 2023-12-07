import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';

class AdjustmentItem extends StatelessWidget {
  const AdjustmentItem({
    super.key,
    required this.prayerName,
    required this.prayerTime,
  });

  final String prayerName;
  final DateTime prayerTime;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Row(
      children: [
        Expanded(
          child: MaterialButton(
            onPressed: () {
              // Decrement minutes
            },
            elevation: 0,
            shape: AppStyles.mainShapeMini,
            color: appColors.quaternaryColor,
            child: const Icon(Icons.remove),
          ),
        ),
        Expanded(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$prayerName\n',
                  style: TextStyle(
                    color: appColors.onSurface,
                    fontSize: 18,
                    fontFamily: 'Nexa',
                  ),
                ),
                TextSpan(
                  text: DateFormat.Hm().format(prayerTime),
                  style: TextStyle(
                    color: appColors.onSurface,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Bitter',
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: MaterialButton(
            onPressed: () {
              // Increment minutes
            },
            elevation: 0,
            shape: AppStyles.mainShapeMini,
            color: appColors.secondaryColor,
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
