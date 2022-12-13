import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/model/model_supplications_from_quran.dart';

class SupplicationFromQuranItem extends StatelessWidget {
  const SupplicationFromQuranItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ModelSupplicationsFromQuran item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: MainAppStyle.mainBorderRadius,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      child: Center(
        child: SingleChildScrollView(
          padding: MainAppStyle.mainPadding,
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.indigo,
                child: Text(
                  item.id.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                item.ayahArabic,
                style: const TextStyle(
                  fontSize: 25,
                  fontFamily: 'Quran',
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Html(
                data: item.ayahTranslation,
                style: {
                  '#': Style(
                    fontSize: const FontSize(20),
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    textAlign: TextAlign.center,
                  ),
                  'small': Style(
                    fontSize: const FontSize(12),
                    color: Colors.grey,
                  ),
                },
              ),
              const SizedBox(height: 16),
              Text(
                item.ayahSource,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.indigo,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
