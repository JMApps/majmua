import 'package:flutter/material.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';

class ParamButton extends StatelessWidget {
  const ParamButton({
    super.key,
    required this.description,
    required this.routeName,
  });

  final String description;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      color: appColors.primaryColor,
      shape: AppStyles.mainShapeMicro,
      elevation: 0.25,
      child: Text(
        description,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
