import 'package:flutter/material.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/data/database/arguments/supplication_arguments.dart';

class PrayerSupplications extends StatelessWidget {
  const PrayerSupplications({
    Key? key,
    required this.showButton,
    required this.color,
    required this.supplicationsIndex,
  }) : super(key: key);

  final bool showButton;
  final Color color;
  final int supplicationsIndex;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showButton,
      child: Align(
        alignment: Alignment.topRight,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              'supplications_page',
              arguments: SupplicationArguments(
                supplicationIndex: supplicationsIndex,
              ),
            );
          },
          splashColor: color.withOpacity(0.5),
          radius: 25,
          borderRadius: AppWidgetStyle.mainBorderRadius,
          child: Image.asset(
            'assets/icons/dua-hands.png',
            width: 22.5,
            height: 22.5,
            color: color,
          ),
        ),
      ),
    );
  }
}
