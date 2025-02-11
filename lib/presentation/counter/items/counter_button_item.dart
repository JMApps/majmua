import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../state/counter_state.dart';

class CounterButtonItem extends StatelessWidget {
  const CounterButtonItem({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final mediaQuery = MediaQuery.of(context);
    return Container(
      padding: AppStyles.mainMarding,
      alignment: Alignment.center,
      child: Consumer<CounterState>(
        builder: (context, counterState, _) {
          return IconButton(
            onPressed: () {
              counterState.onCountClick();
              if (counterState.tacticFeedback) {
                HapticFeedback.lightImpact();
              }
            },
            splashColor: appColors.secondary,
            icon: Icon(
              Icons.fingerprint_rounded,
              color: appColors.primary,
              size: mediaQuery.orientation == Orientation.portrait ? mediaQuery.size.width * 0.85 :  mediaQuery.size.width * 0.25,
            ),
          );
        },
      ),
    );
  }
}
