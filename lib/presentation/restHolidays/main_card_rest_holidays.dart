import 'package:flutter/material.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/restHolidays/item_holiday.dart';

class MainCardRestHolidays extends StatelessWidget {
  const MainCardRestHolidays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).colorScheme;
    return Padding(
      padding: AppWidgetStyle.horizontalPaddingMini,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ItemHoliday(
            holidayName: 'Осталось дней до Рамадана',
            days: 64,
            color: appColor.firstAppColor,
          ),
          const SizedBox(height: 8),
          ItemHoliday(
            holidayName: 'Осталось дней до Ид аль-Адха',
            days: 156,
            color: appColor.secondAppColor,
          ),
        ],
      ),
    );
  }
}
