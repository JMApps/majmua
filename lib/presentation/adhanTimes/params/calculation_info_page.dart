import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/strings/app_strings.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/data/models/adhan_information_model.dart';
import 'package:majmua/presentation/adhanTimes/params/item_calculation_prayer_time.dart';
import 'package:majmua/presentation/widgets/user_back_button.dart';

class CalculationInfoPage extends StatelessWidget {
  const CalculationInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const UserBackButton(),
        title: Text(appLocale!.information),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: appColors.surface,
                builder: (_) => Padding(
                  padding: AppStyles.mardingWithoutTop,
                  child: Text(
                    appLocale.prayerTimeCalculationDescription,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            },
            splashRadius: 20,
            icon: Image.asset(
              'assets/icons/info.png',
              width: 20,
              height: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: AppStyles.mainMardingMini,
              margin: AppStyles.mainMardingMini,
              decoration: BoxDecoration(
                color: appColors.primaryContainer,
                borderRadius: AppStyles.mainBorderRadiusMini,
              ),
              child: Text(
                appLocale.calculationMethodsInApp,
                style: const TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            CupertinoScrollbar(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: AppStrings.calculationMethodInfo.length,
                itemBuilder: (BuildContext context, int index) {
                  final AdhanInformationModel item =
                  AppStrings.calculationMethodInfo[index];
                  return ItemCalculationPrayerTime(item: item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
