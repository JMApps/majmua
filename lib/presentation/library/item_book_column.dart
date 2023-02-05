import 'package:flutter/material.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';

class ItemBookColumn extends StatelessWidget {
  const ItemBookColumn({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.color,
    required this.route,
    required this.index,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final IconData icon;
  final Color color;
  final String route;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return ListTile(
      onTap: () {},
      shape: AppWidgetStyle.mainRectangleBorder,
      contentPadding: const EdgeInsets.only(right: 8),
      visualDensity: const VisualDensity(vertical: -4),
      horizontalTitleGap: 8,
      title: Text(title),
      subtitle: Text(subTitle),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: color,
        child: Text(
          '$index',
          style: const TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 17.5,
        color: appColors.mainTextColor,
      ),
    );
  }
}
