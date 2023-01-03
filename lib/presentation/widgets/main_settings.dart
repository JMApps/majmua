import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';

class MainBookSettings extends StatelessWidget {
  const MainBookSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: AppStyles.mainCardBorderRadius,
      margin: AppStyles.mainMargin,
      child: Padding(
        padding: AppStyles.mainPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              visualDensity: const VisualDensity(vertical: -4),
              contentPadding: EdgeInsets.zero,
              title: const Text(
                'Размер текста',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              subtitle: Slider.adaptive(
                value: 0,
                onChanged: (double? value) {},
              ),
            ),
            ListTile(
              visualDensity: const VisualDensity(vertical: -4),
              contentPadding: EdgeInsets.zero,
              title: const Text(
                'Цвет текста',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              subtitle: Slider.adaptive(
                value: 0,
                onChanged: (double? value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
