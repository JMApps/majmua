import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/counter_state.dart';

class CountTitleItem extends StatelessWidget {
  const CountTitleItem({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Consumer<CounterState>(
      builder: (context, counterState, _) {
        return AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: counterState.countShowState ? 1.0 : 0,
          child: Text(
            counterState.currentCount(),
            style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: appColors.secondary,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        );
      },
    );
  }
}
