import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.mainAppTitle),
      ),
    );
  }
}
