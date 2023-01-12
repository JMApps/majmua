import 'package:flutter/material.dart';

class ItemSegmentSeasonTime extends StatelessWidget {
  const ItemSegmentSeasonTime({
    Key? key,
    required this.seasonName,
    required this.imageName,
  }) : super(key: key);

  final String seasonName;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Text(seasonName);
  }
}
