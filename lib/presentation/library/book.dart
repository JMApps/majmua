import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';

class Book extends StatelessWidget {
  const Book({
    Key? key,
    required this.bookTitle,
    required this.bookSubTitle,
    required this.bookColor,
    required this.bookNumber,
    required this.routeName,
  }) : super(key: key);

  final String bookTitle;
  final String bookSubTitle;
  final Color bookColor;
  final int bookNumber;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      visualDensity: const VisualDensity(vertical: -2),
      contentPadding: AppStyles.symmetricHorizontalPadding,
      leading: CircleAvatar(
        backgroundColor: bookColor,
        radius: 20,
        child: Text(
          bookNumber.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      title: Text(bookTitle),
      subtitle: Text(bookSubTitle),
    );
  }
}
