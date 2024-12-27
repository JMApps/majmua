import 'package:flutter/material.dart';

class MainIconButton extends StatelessWidget {
  const MainIconButton({
    super.key,
    required this.tooltip,
    required this.onPressed,
    required this.iconName,
    required this.iconColor,
  });

  final String tooltip;
  final VoidCallback onPressed;
  final String iconName;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      tooltip: tooltip,
      icon: Image.asset(
        'assets/icons/$iconName.png',
        height: 25,
        width: 25,
        color: iconColor,
      ),
    );
  }
}
