import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/presentation/supplications/column_supplications.dart';

class CardSelectSupplications extends StatelessWidget {
  const CardSelectSupplications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (_) => const ColumnSupplications(),
          );
        },
        borderRadius: AppWidgetStyle.mainBorderRadius,
        child: const Padding(
          padding: AppWidgetStyle.mainPaddingMini,
          child: Text(
            AppString.supplications,
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
