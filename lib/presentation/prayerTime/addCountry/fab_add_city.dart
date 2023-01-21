import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/prayerTime/addCountry/card_add_city.dart';

class FabAddCity extends StatelessWidget {
  const FabAddCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          context: context,
          builder: (_) => AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets,
            duration: const Duration(milliseconds: 250),
            curve: Curves.decelerate,
            child: const CardAddCity(),
          ),
        );
      },
      elevation: 0,
      backgroundColor: appColors.thirdAppColor,
      child: const Icon(CupertinoIcons.add),
    );
  }
}
