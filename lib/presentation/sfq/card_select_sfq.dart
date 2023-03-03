import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';

class CardSelectSFQ extends StatelessWidget {
  const CardSelectSFQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: AppWidgetStyle.horizontalMarginMini,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, 'sfq_page');
        },
        borderRadius: AppWidgetStyle.mainBorderRadius,
        child: const Padding(
          padding: AppWidgetStyle.mainPaddingMini,
          child: Text(
            AppString.sfq,
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
