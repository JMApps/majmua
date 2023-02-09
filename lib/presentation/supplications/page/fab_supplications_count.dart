import 'package:flutter/material.dart';
import 'package:majmua/application/state/supplications_counter_state.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:provider/provider.dart';

class FabSupplicationsCount extends StatelessWidget {
  const FabSupplicationsCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Consumer<SupplicationsCounterState>(
      builder: (context, counterState, _) {
        return AnimatedSize(
          duration: const Duration(milliseconds: 750),
          child: Visibility(
            visible: counterState.getCounterButtonIsShow,
            child: FloatingActionButton.large(
              onPressed: () {
                counterState.decrement;
              },
              backgroundColor: appColors.thirdAppColor,
              elevation: 0,
              child: Center(
                child: Text(
                  '${counterState.getCount}',
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
