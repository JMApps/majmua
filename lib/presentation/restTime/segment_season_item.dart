import 'package:flutter/material.dart';
import 'package:square_percent_indicater/square_percent_indicater.dart';

class SegmentSeasonItem extends StatelessWidget {
  const SegmentSeasonItem({
    Key? key,
    required this.percent,
    required this.color,
    required this.seasonName,
  }) : super(key: key);

  final double percent;
  final Color color;
  final String seasonName;

  @override
  Widget build(BuildContext context) {
    return SquarePercentIndicator(
      progress: percent <= 100 ? percent / 100 : 1.0,
      progressWidth: 2,
      progressColor: color,
      shadowColor: color.withOpacity(0.25),
      borderRadius: 6,
      shadowWidth: 2,
      height: 27.5,
      width: double.infinity,
      child: Center(
        child: Text(
          seasonName,
        ),
      ),
    );
  }
}
