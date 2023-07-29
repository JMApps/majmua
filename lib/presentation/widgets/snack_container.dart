import 'package:flutter/material.dart';

class SnackContainer extends StatelessWidget {
  const SnackContainer({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(
        fontSize: 20,
        fontFamily: 'Nexa',
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }
}
