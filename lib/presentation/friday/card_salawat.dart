import 'package:flutter/material.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/state/weekly_salawat_state.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:provider/provider.dart';

class CardSalawat extends StatelessWidget {
  const CardSalawat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return AnimatedSize(
      duration: const Duration(milliseconds: 1750),
      curve: Curves.easeInOutSine,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => WeeklySalawatState(),
          ),
        ],
        child: Consumer<WeeklySalawatState>(
          builder: (BuildContext context, weeklySalawatState, _) {
            return context.watch<RestTimeState>().getCdt.weekday == 2
                ? Card(
                    margin: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            onPressed: () {
                              weeklySalawatState.changeSalawatCount();
                            },
                            splashColor: Colors.white.withOpacity(
                              Theme.of(context).brightness == Brightness.light
                                  ? 1
                                  : 0.25,
                            ),
                            splashRadius: 75,
                            iconSize: 200,
                            icon: Image.asset(
                              'assets/images/salawat.png',
                              fit: BoxFit.cover,
                              opacity: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? const AlwaysStoppedAnimation(1)
                                  : const AlwaysStoppedAnimation(0.5),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: AppWidgetStyle.mainPaddingMini,
                            child: Chip(
                              avatar: CircleAvatar(
                                backgroundColor: appColors.secondAppColor,
                                child: const Text(
                                  'ﷺ',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              label: Text(
                                '${weeklySalawatState.getSalawatCount}',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: appColors.mainTextColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox();
          },
        ),
      ),
    );
  }
}
