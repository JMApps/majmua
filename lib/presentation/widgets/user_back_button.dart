import 'package:flutter/material.dart';

class UserBackButton extends StatelessWidget {
  const UserBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      splashRadius: 20,
      icon: Image.asset(
        'assets/icons/angle-left.png',
        width: 20,
        height: 20,
        color: Colors.white,
      ),
    );
  }
}
