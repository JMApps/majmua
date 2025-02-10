import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../state/counter_state.dart';

class CountsDropDown extends StatelessWidget {
  const CountsDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Consumer<CounterState>(
      builder: (context, counterState, _) {
        return DropdownButton<int>(
          padding: AppStyles.mardingHorizontalMini,
          borderRadius: AppStyles.mainBorderMini,
          elevation: counterState.countIndex,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          alignment: Alignment.center,
          value: counterState.countIndex,
          items: List.generate(
            AppStringConstraints.tasbeehCounts.length, (index) {
              return DropdownMenuItem<int>(
                value: index,
                child: Center(
                  child: Text(
                    AppStringConstraints.tasbeehCounts[index],
                    style: counterState.countIndex == index ? TextStyle(
                      fontSize: 20.0,
                      color: appColors.primary,
                      fontWeight: FontWeight.bold,
                    ) : AppStyles.mainTextStyleBig,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
          onChanged: (newIndex) => counterState.countIndex = newIndex!,
          underline: const SizedBox(),
        );
      },
    );
  }
}
