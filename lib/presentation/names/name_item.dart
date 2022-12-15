import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/model/model_name_item.dart';

class NameItem extends StatelessWidget {
  const NameItem({Key? key, required this.item}) : super(key: key);

  final ModelNameItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: MainAppStyle.mainCardBorderRadius,
      child: Card(
        elevation: 0,
        margin: MainAppStyle.mainMarginMini,
        shape: RoundedRectangleBorder(
          borderRadius: MainAppStyle.mainBorderRadius,
          side: BorderSide(
            width: 1,
            color: Colors.indigo.shade300,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.teal,
                  child: Text(
                    '${item.id}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Center(
                child: ListTile(
                  title: Text(
                    item.nameArabic,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Lateef',
                      color: Colors.indigo,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    item.nameTranslation,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
