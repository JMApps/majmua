import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/presentation/widgets/main_text_settings.dart';

class ButtonMainTextSettings extends StatelessWidget {
  const ButtonMainTextSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (_) => const MainTextSettings(),
        );
      },
      icon: const Icon(
        CupertinoIcons.settings,
      ),
    );
  }
}
