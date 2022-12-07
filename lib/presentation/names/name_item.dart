import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';

class NameItem extends StatelessWidget {
  const NameItem({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: MainAppStyle.mainBorderRadius,
      ),
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
        child: Container(
          padding: MainAppStyle.mainPadding,
          alignment: Alignment.center,
          child: Text('Name $index'),
        ),
      ),
    );
  }
}
