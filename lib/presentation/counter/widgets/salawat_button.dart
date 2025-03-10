import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../state/salawat_state.dart';

class SalawatButton extends StatelessWidget {
  const SalawatButton({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppStyles.mardingWithoutBottomMini,
      child: Row(
        children: [
          const SizedBox(width: 8),
          const Expanded(
            flex: 3,
            child: SizedBox(),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/pictures/salawat.png',
                        color: appColors.primary,
                      ),
                      Image.asset(
                        'assets/pictures/salawat_border_two.png',
                        color: appColors.tertiaryFixed,
                      ),
                    ],
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
