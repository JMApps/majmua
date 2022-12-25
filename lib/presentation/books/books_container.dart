import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';

class BooksContainer extends StatelessWidget {
  const BooksContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 0,
      shape: AppStyles.mainCardBorderRadius,
      margin: AppStyles.symmetricHorizontalMarginMini,
      child: ListTile(
        visualDensity: VisualDensity(vertical: -2),
        contentPadding: AppStyles.symmetricHorizontalPadding,
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.indigo,
        ),
        title: Text('Библиотека'),
      ),
    );
  }
}
