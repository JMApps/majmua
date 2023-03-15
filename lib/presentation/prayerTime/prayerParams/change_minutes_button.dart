import 'package:flutter/material.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/prayerTime/prayerParams/adjustment_minutes.dart';

class AdjustmentMinutesButton extends StatelessWidget {
  const AdjustmentMinutesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).colorScheme;
    return Card(
      child: IconButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (_) => const AdjustmentMinutes(),
          );
        },
        color: appColor.glassOnGlassCardColor,
        visualDensity: const VisualDensity(vertical: -4),
        splashRadius: 17.5,
        icon: Icon(
          Icons.access_time_rounded,
          color: appColor.mainTextColor,
          size: 20,
        ),
      ),
    );
  }
}
