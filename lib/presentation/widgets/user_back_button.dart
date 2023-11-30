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
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
    );
  }
}
