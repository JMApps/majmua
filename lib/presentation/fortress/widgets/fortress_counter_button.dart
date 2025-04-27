import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../state/fortress_count_state.dart';

class FortressCounterButton extends StatelessWidget {
  const FortressCounterButton({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return ChangeNotifierProvider(
      create: (context) => FortressCountState(count),
      child: Consumer<FortressCountState>(
        builder: (context, countState, _) {
          return SizedBox(
            width: 115,
            height: 115,
            child: IconButton.filled(
              onPressed: () => countState.onCountClick(),
              onLongPress: () => countState.resetCount(),
              icon: Padding(
                padding: AppStyles.mardingTopMicroMini,
                child: Text(
                  countState.getSupplicationCount.toString(),
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: appColors.primaryContainer,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
