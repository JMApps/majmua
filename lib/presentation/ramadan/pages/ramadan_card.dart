import 'package:flutter/material.dart';

import '../../../core/styles/app_styles.dart';

class RamadanCard extends StatelessWidget {
  const RamadanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnimatedSize(
      duration: Duration(milliseconds: 1500),
      child: Visibility(
        visible: false,
        child: Card(
          margin: AppStyles.mardingWithoutBottomMini,
          child: Padding(
            padding: AppStyles.mainMardingMini,
            child: Column(
              children: [
                Text('Благословенный Рамадан'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
