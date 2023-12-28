import 'package:flutter/material.dart';
import 'package:majmua/core/styles/app_styles.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.bookNumber,
    required this.routeName,
    required this.color,
  });

  final String title;
  final String subTitle;
  final int bookNumber;
  final String routeName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, routeName);
      },
      title: Text(
        title,
      ),
      subtitle: Text(
        subTitle,
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
      contentPadding: AppStyles.mardingHorizontalMini,
      shape: AppStyles.mainShapeMini,
      visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: color,
        child: Text(
          bookNumber.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      trailing: Image.asset(
        'assets/icons/angle-right.png',
        width: 20,
        height: 20,
        color: appColors.primary,
      ),
    );
  }
}
