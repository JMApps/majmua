import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/presentation/names/names_list.dart';
import 'package:majmua/presentation/widgets/button_main_text_settings.dart';

class OnlyNamesOfPage extends StatelessWidget {
  const OnlyNamesOfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.namesOf),
        actions: const [
          ButtonMainTextSettings(),
        ],
      ),
      body: const NamesList(),
    );
  }
}
