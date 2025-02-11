import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../state/counter_state.dart';

class AllCountItem extends StatelessWidget {
  const AllCountItem({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Consumer<CounterState>(
      builder: (context, counterState, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: counterState.countShowState ? 1.0 : 0.0,
              child: Text(
                counterState.getAllCounts.toString(),
                style: AppStyles.mainTextStyleMini,
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(
              onPressed: () {
                counterState.restoreAllCountValue();
              },
              visualDensity: VisualDensity.compact,
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.refresh_rounded),
              color: appColors.tertiary,
            ),
          ],
        );
      },
    );
  }
}
