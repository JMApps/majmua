import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/presentation/surah/column_surahs.dart';

class CardSelectSurahs extends StatelessWidget {
  const CardSelectSurahs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (_) => const ColumnSurahs(),
          );
        },
        borderRadius: AppWidgetStyle.mainBorderRadius,
        child: const Padding(
          padding: AppWidgetStyle.mainPaddingMini,
          child: Text(
            AppString.surahs,
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
