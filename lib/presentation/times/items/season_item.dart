import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:square_progress_indicator/square_progress_indicator.dart';

import '../../../core/enums/season.dart';
import '../../../core/enums/time_period.dart';
import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../state/time_state.dart';
import '../widgets/season_name.dart';

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
      height: 27.5,
      value: Provider.of<TimeState>(context).restPeriodTimes(timePeriod: TimePeriod.season)[AppStringConstraints.elapsedPercentage] / 100,
      startPosition: StartPosition.topCenter,
      strokeAlign: SquareStrokeAlign.center,
      clockwise: true,
      color: appColors.primary,
      emptyStrokeColor: appColors.primaryContainer.withAlpha(125),
      strokeWidth: 2.5,
      emptyStrokeWidth: 1.25,
      child: Container(
        alignment: Alignment.center,
        margin: AppStyles.mainMardingMicroMini,
        decoration: BoxDecoration(
          borderRadius: AppStyles.mainBorderMicro,
          image: DecorationImage(
            image: AssetImage('assets/pictures/${AppStringConstraints.timePeriodPics[season.index]}.png'),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        child: SeasonName(seasonName: seasonName),
      ),
    );
  }
}