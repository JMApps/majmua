import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/model/arguments/arguments_raqaiq.dart';
import 'package:majmua/data/database/model/model_raqaiq_item.dart';

class RaqaiqItem extends StatelessWidget {
  const RaqaiqItem({Key? key, required this.item}) : super(key: key);

  final ModelRaqaiqItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: MainAppStyle.mainBorderRadius,
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            'raqaiq_content_page',
            arguments: ArgumentsRaqaiq(
              chapterId: item.id,
            ),
          );
        },
        borderRadius: MainAppStyle.mainBorderRadius,
        child: Center(
          child: ListTile(
            contentPadding: MainAppStyle.mainPadding,
            title: Text(
              'Глава ${item.id}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.orange.shade700,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              item.chapterTitle,
              style: const TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
