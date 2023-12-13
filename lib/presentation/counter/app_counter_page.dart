import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/strings/app_strings.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/state/app_counter_state.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class AppCounterPage extends StatelessWidget {
  const AppCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppCounterState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocale!.counter),
        ),
        body: Consumer<AppCounterState>(
          builder: (BuildContext context, AppCounterState appCounterState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      appCounterState.mainCountClick =
                          appCounterState.getCountValuesIndex;
                    },
                    iconSize: screenWidth * 0.75,
                    splashRadius: screenWidth * 0.41,
                    splashColor: appColors.primary,
                    icon: Container(
                      height: screenWidth * 0.75,
                      width: screenWidth * 0.75,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: appColors.glass,
                        boxShadow: [
                          BoxShadow(
                            color: appColors.primary,
                            blurRadius: 15,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: AppStyles.mainMardingMicro,
                        child: CircularStepProgressIndicator(
                          totalSteps: 100,
                          currentStep: appCounterState.getCountValuesIndex == 0
                              ? 100
                              : appCounterState.getCurrentCountValue,
                          stepSize: 5,
                          selectedStepSize: 6,
                          padding: pi / 30,
                          circularDirection: CircularDirection.counterclockwise,
                          selectedColor: appColors.secondaryColor,
                          unselectedColor:
                              appColors.secondaryColor.withOpacity(0.25),
                          child: Center(
                            child: Text(
                              appCounterState.getIsShow
                                  ? appCounterState.getCurrentCountValue
                                      .toString()
                                  : '',
                              style: TextStyle(
                                color: appColors.primary,
                                fontSize: screenWidth * 0.25,
                                fontFamily: 'Bitter',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: AppStyles.mardingWithoutBottom,
                  shape: AppStyles.mainShapeMini,
                  color: appColors.glass,
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: Padding(
                      padding: AppStyles.mainMardingMini,
                      child: DropdownButton<String>(
                        value: AppStrings.getCounterValues(
                                locale: appLocale.localeName)[
                            appCounterState.getCountValuesIndex],
                        borderRadius: AppStyles.mainBorderRadiusMini,
                        elevation: 0,
                        isExpanded: true,
                        alignment: AlignmentDirectional.center,
                        dropdownColor: appColors.surface,
                        style: TextStyle(
                          fontSize: 16,
                          color: appColors.inverseSurface,
                          fontFamily: 'Naskh Arabic',
                        ),
                        underline: const SizedBox(),
                        onChanged: (String? value) {
                          appCounterState.setCountValuesIndex =
                              AppStrings.getCounterValues(
                                      locale: appLocale.localeName)
                                  .indexOf(value!);
                        },
                        items: AppStrings.getCounterValues(
                                locale: appLocale.localeName)
                            .map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Center(
                                child: Text(
                                  value,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: AppStyles.mainMarding,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: appLocale.totalValue,
                          style: TextStyle(
                            fontFamily: 'Nexa',
                            color: appColors.onSurface,
                          ),
                        ),
                        TextSpan(
                          text: appCounterState.getIsShow
                              ? appCounterState.getTotalCountValue.toString()
                              : '',
                          style: TextStyle(
                            color: appColors.secondaryColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Bitter',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: Card(
          color: appColors.glass,
          margin: EdgeInsets.zero,
          child: Padding(
            padding: AppStyles.mainMarding,
            child: Consumer<AppCounterState>(
              builder:
                  (BuildContext context, AppCounterState appCounterState, _) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Visibility(
                      visible: Platform.isIOS,
                      maintainSize: false,
                      maintainAnimation: false,
                      child: CircleAvatar(
                        child: IconButton(
                          onPressed: () {
                            appCounterState.onChangeIsClick;
                          },
                          tooltip: appLocale.clicked,
                          splashRadius: 25,
                          icon: Icon(
                            Icons.volume_up,
                            color: appCounterState.getIsClick
                                ? Colors.white
                                : appColors.quaternaryColor,
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      child: IconButton(
                        onPressed: () {
                          appCounterState.onChangeVibrateState;
                        },
                        tooltip: appLocale.vibration,
                        splashRadius: 25,
                        icon: Icon(
                          Icons.vibration,
                          color: appCounterState.getIsVibrate
                              ? Colors.white
                              : appColors.quaternaryColor,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      child: IconButton(
                        onPressed: () {
                          appCounterState.onChangeIsShow;
                        },
                        tooltip: appLocale.show,
                        splashRadius: 25,
                        icon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: appCounterState.getIsShow
                              ? Colors.white
                              : appColors.quaternaryColor,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      child: IconButton(
                        onPressed: () {
                          appCounterState.resetSelectedCount =
                              appCounterState.getCountValuesIndex;
                        },
                        tooltip: appLocale.reset,
                        splashRadius: 25,
                        icon: const Icon(Icons.refresh),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
