import 'package:flutter/material.dart';
import 'package:majmua/application/themes/app_theme.dart';

class FabSupplicationsCount extends StatelessWidget {
  const FabSupplicationsCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return FloatingActionButton.large(
      onPressed: () {},
      backgroundColor: appColors.thirdAppColor,
      elevation: 0,
      child: const Center(
        child: Text(
          '100',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
