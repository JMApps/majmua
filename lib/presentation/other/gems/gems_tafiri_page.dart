import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';

class GemsTarifiPage extends StatelessWidget {
  const GemsTarifiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.gemsTarifi),
      ),
    );
  }
}
