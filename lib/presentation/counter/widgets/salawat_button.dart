import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../state/prayer_state.dart';
import '../../state/salawat_state.dart';
import '../../times/items/main_data_item.dart';

class SalawatButton extends StatelessWidget {
  const SalawatButton({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppStyles.mardingWithoutBottomMini,
      child: Row(
        children: [
          const Expanded(
            flex: 3,
            child:  MainDataItem(),
          ),
          Expanded(
            child: Column(
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Consumer<PrayerState>(
                    builder: (context, prayerState, _) {
                      return Stack(
                        children: [
                          Image.asset(
                            'assets/pictures/salawat.png',
                            color: prayerState.isFriday ? appColors.tertiary : appColors.primary,
                          ),
                          Image.asset(
                            'assets/pictures/salawat_border_two.png',
                            color: prayerState.isFriday ? appColors.primary : appColors.tertiary,
                          ),
                        ],
                      );
                    },
                  ),
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    Provider.of<SalawatState>(context, listen: false).incrementCount();
                  },
                  onLongPress: () {
                    HapticFeedback.vibrate();
                    Provider.of<SalawatState>(context, listen: false).resetCount();
                  },
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: AppStyles.mainBorderMini,
                      side: BorderSide(
                        color: appColors.primary,
                        width: 1,
                      ),
                    ),
                    margin: AppStyles.mardingWithoutTopMini,
                    child: Padding(
                      padding: AppStyles.mardingTopMicroMini,
                      child: Padding(
                        padding: AppStyles.mardingHorizontalMini,
                        child: Consumer<SalawatState>(
                          builder: (context, salawatState, _) {
                            return Text(
                              salawatState.salawatCount.toString(),
                              style: AppStyles.mainTextStyleMicroBold,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
