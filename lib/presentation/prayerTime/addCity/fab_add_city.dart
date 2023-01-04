import 'package:flutter/material.dart';
import 'package:majmua/presentation/prayerTime/addCity/card_add_city.dart';

class FabAddCity extends StatelessWidget {
  const FabAddCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets,
            duration: const Duration(milliseconds: 250),
            curve: Curves.decelerate,
            child: const CardAddCity(),
          ),
        );
      },
      elevation: 0,
      child: const Icon(Icons.add),
    );
  }
}
