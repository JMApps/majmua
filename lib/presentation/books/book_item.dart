import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    Key? key,
    required this.routeName,
    required this.title,
    required this.subTitle,
    required this.color,
  }) : super(key: key);

  final String routeName;
  final String title;
  final String subTitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      shape: MainAppStyle.mainCardBorderRadius,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black87
        ),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(
          fontSize: 18,
          color: color
        ),
      ),
    );
  }
}
