import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../state/time_state.dart';

class MainDataItem extends StatelessWidget {
  const MainDataItem({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Consumer<TimeState>(
      builder: (context, timeState, _) {
        return Padding(
          padding: AppStyles.mardingLeftMini,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Card(
                  color: appColors.surface,
                  margin: AppStyles.mardingTopMini,
                  child: Center(
                    child: ListTile(
                      contentPadding: AppStyles.mardingHorizontalMini,
                      visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                      splashColor: appColors.tertiaryContainer,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => IgnorePointer(
                            child: SfDateRangePicker(
                              todayHighlightColor: Colors.transparent,
                              monthCellStyle: DateRangePickerMonthCellStyle(
                                todayTextStyle: TextStyle(
                                  color: appColors.tertiary,
                                  fontWeight: FontWeight.bold,
                                ),
                                todayCellDecoration: BoxDecoration(
                                  color: appColors.tertiaryContainer,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              view: DateRangePickerView.month,
                              backgroundColor: appColors.surfaceContainerLow,
                              headerHeight: 0,
                              allowViewNavigation: false,
                              showTodayButton: false,
                              showNavigationArrow: false,
                            ),
                          ),
                        );
                      },
                      title: Text(
                        appLocale.gregorianMonthNames.split(', ')[timeState.getDateTime.month - 1],
                        style: TextStyle(
                          fontFamily: AppStringConstraints.fontGilroyMedium,
                          color: appColors.tertiary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        '${timeState.getDateTime.year} ${appLocale.year.toLowerCase()}',
                        style: TextStyle(
                          fontFamily: AppStringConstraints.fontGilroy,
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: appColors.tertiaryContainer,
                        child: Padding(
                          padding: AppStyles.mardingTopMicroMini,
                          child: Text(
                            '${timeState.getDateTime.day}',
                            style: TextStyle(
                              color: appColors.tertiary,
                              fontFamily: AppStringConstraints.fontGilroyMedium,
                            ),
                          ),
                        ),
                      ),
                      trailing: Icon(Icons.arrow_right_rounded),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Card(
                  color: appColors.surface,
                  margin: AppStyles.mardingBottomMini,
                  child: Center(
                    child: ListTile(
                      contentPadding: AppStyles.mardingHorizontalMini,
                      visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                      splashColor: appColors.primaryContainer,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => IgnorePointer(
                            child: SfHijriDateRangePicker(
                              todayHighlightColor: Colors.transparent,
                              monthCellStyle: HijriDatePickerMonthCellStyle(
                                todayTextStyle: TextStyle(
                                  color: appColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                                todayCellDecoration: BoxDecoration(
                                  color: appColors.inversePrimary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              view: HijriDatePickerView.month,
                              backgroundColor: appColors.surfaceContainerLow,
                              headerHeight: 0,
                              allowViewNavigation: false,
                              showTodayButton: false,
                              showNavigationArrow: false,
                            ),
                          ),
                        );
                      },
                      title: Text(
                        appLocale.hijriMonthNames.split(', ')[timeState.getHijriDateTime.hMonth - 1],
                        style: TextStyle(
                          fontFamily: AppStringConstraints.fontGilroyMedium,
                          color: appColors.primary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        '${timeState.getHijriDateTime.hYear} ${appLocale.year.toLowerCase()}',
                        style: TextStyle(
                          fontFamily: AppStringConstraints.fontGilroy,
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: appColors.primaryContainer,
                        child: Padding(
                          padding: AppStyles.mardingTopMicroMini,
                          child: Text(
                            '${timeState.getHijriDateTime.hDay}',
                            style: TextStyle(
                              color: appColors.primary,
                              fontFamily: AppStringConstraints.fontGilroyMedium,
                            ),
                          ),
                        ),
                      ),
                      trailing: Icon(Icons.arrow_right_rounded),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
