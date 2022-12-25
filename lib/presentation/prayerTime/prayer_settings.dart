import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';

class RegionSettings extends StatefulWidget {
  const RegionSettings({Key? key}) : super(key: key);

  @override
  State<RegionSettings> createState() => _RegionSettingsState();
}

class _RegionSettingsState extends State<RegionSettings> {
  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выбор региона'),
      ),
      body: SingleChildScrollView(
        padding: AppStyles.mainPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Текущий город: ',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 18,
                      fontFamily: 'Nexa',
                    ),
                  ),
                  TextSpan(
                    text: 'Турция, ',
                    style: TextStyle(
                      color: appColors.mainTextColor,
                      fontSize: 18,
                      fontFamily: 'Nexa',
                    ),
                  ),
                  TextSpan(
                    text: 'Стамбул',
                    style: TextStyle(
                      color: appColors.mainTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: 'Nexa',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Система расчета времени молитв:',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
