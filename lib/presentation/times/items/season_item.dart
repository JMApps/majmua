import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:square_progress_indicator/square_progress_indicator.dart';

import '../../../core/enums/season.dart';
import '../../../core/enums/time_period.dart';
import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../state/time_state.dart';

class SeasonItem extends StatelessWidget {
  const SeasonItem({super.key,
    required this.season,
    required this.seasonName,
  });

  final Season season;
  final String seasonName;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return SquareProgressIndicator(
      width: double.infinity,
      height: 25,
      value: Provider.of<TimeState>(context).restPeriodTimes(timePeriod: TimePeriod.season)[AppStringConstraints.elapsedPercentage] / 100,
      startPosition: StartPosition.topCenter,
      strokeAlign: SquareStrokeAlign.outside,
      clockwise: true,
      color: appColors.primary,
      emptyStrokeColor: appColors.primaryContainer.withAlpha(125),
      strokeWidth: 1.75,
      emptyStrokeWidth: 1.75,
      child: Container(
        alignment: Alignment.center,
        margin: AppStyles.mainMardingMicroMini,
        decoration: BoxDecoration(
          borderRadius: AppStyles.mainBorderMicro,
          color: appColors.tertiaryContainer,
        ),
        child: Text(seasonName),
      ),
    );
  }
}