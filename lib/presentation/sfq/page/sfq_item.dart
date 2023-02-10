import 'package:flutter/material.dart';
import 'package:majmua/application/state/text_settings_state.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/data/database/models/sfq_model.dart';
import 'package:provider/provider.dart';

class SFQItem extends StatelessWidget {
  const SFQItem({Key? key, required this.item}) : super(key: key);

  final SFQModel item;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      color: appColors.mainReverse,
      margin: AppWidgetStyle.mainMarginMini,
      child: Center(
        child: SingleChildScrollView(
          padding: AppWidgetStyle.mainPadding,
          child: Consumer<TextSettingsState>(
            builder: (context, settingsState, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.ayahArabic,
                    style: TextStyle(
                      color: appColors.mainTextColor,
                      fontSize: settingsState.getFontSize + 3.0,
                      fontFamily: 'Scheherazade',
                    ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.ayahTranslation,
                    style: TextStyle(
                      fontSize: settingsState.getFontSize,
                      color: appColors.mainTextColor,
                    ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    item.ayahSource,
                    style: TextStyle(
                      fontSize: 12,
                      color: appColors.firstAppColor,
                    ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                  ),
                  const SizedBox(height: 16),
                  CircleAvatar(
                    backgroundColor: appColors.secondAppColor,
                    radius: 20,
                    child: Text(
                      item.id.toString(),
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
