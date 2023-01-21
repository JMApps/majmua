import 'package:flutter/material.dart';
import 'package:majmua/application/state/prayer_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:provider/provider.dart';

class CardDeleteCity extends StatelessWidget {
  const CardDeleteCity({
    Key? key,
    required this.idCity,
  }) : super(key: key);

  final int idCity;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      color: appColors.mainReverse,
      margin: AppWidgetStyle.mainMargin,
      child: Padding(
        padding: AppWidgetStyle.mainPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              shape: AppWidgetStyle.mainRectangleBorder,
              visualDensity: const VisualDensity(vertical: -4),
              title: const Text(
                AppString.cancel,
                textAlign: TextAlign.start,
              ),
              trailing: Icon(
                Icons.cancel,
                size: 20,
                color: appColors.firstAppColor,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                context.read<PrayerTimeState>().deleteCity = idCity;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(milliseconds: 2250),
                    backgroundColor: appColors.firstAppColor,
                    content: const Text(
                      AppString.deleted,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Nexa',
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
              shape: AppWidgetStyle.mainRectangleBorder,
              visualDensity: const VisualDensity(vertical: -4),
              title: const Text(
                AppString.delete,
                textAlign: TextAlign.start,
              ),
              trailing: Icon(
                Icons.delete,
                size: 20,
                color: appColors.thirdAppColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
