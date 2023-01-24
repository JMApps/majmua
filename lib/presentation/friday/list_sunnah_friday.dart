import 'package:flutter/material.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/friday/friday_item.dart';
import 'package:majmua/presentation/friday/model_friday.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ListSunnahFriday extends StatefulWidget {
  const ListSunnahFriday({Key? key}) : super(key: key);

  @override
  State<ListSunnahFriday> createState() => _ListSunnahFridayState();
}

class _ListSunnahFridayState extends State<ListSunnahFriday> {
  final _fridayContentList = const <ModelFriday>[
    ModelFriday(
      id: 1,
      numberSunnah: 'Сунна 1',
      contentSunnah: 'Совершить большое омовение',
    ),
    ModelFriday(
      id: 2,
      numberSunnah: 'Сунна 2',
      contentSunnah: 'Привести себя в порядок',
    ),
    ModelFriday(
      id: 3,
      numberSunnah: 'Сунна 3',
      contentSunnah: 'Надеть чистую одежду',
    ),
    ModelFriday(
      id: 4,
      numberSunnah: 'Сунна 4',
      contentSunnah: 'Умастить себя благовониями',
    ),
    ModelFriday(
      id: 5,
      numberSunnah: 'Сунна 5',
      contentSunnah: 'Пораньше отправиться в мечеть',
    ),
    ModelFriday(
      id: 6,
      numberSunnah: 'Сунна 6',
      contentSunnah: 'Отправиться в мечеть пешком',
    ),
    ModelFriday(
      id: 7,
      numberSunnah: 'Сунна 7',
      contentSunnah: 'Занять место ближе к минбару',
    ),
    ModelFriday(
      id: 8,
      numberSunnah: 'Сунна 8',
      contentSunnah: 'Не перешагивать через других',
    ),
    ModelFriday(
      id: 9,
      numberSunnah: 'Сунна 9',
      contentSunnah: 'Не разговаривать во время хутбы',
    ),
    ModelFriday(
      id: 10,
      numberSunnah: 'Сунна 10',
      contentSunnah:
          'Совершить 4 ракаата, (2 по 2), после джума в мечети или 2 ракаата дома',
    ),
    ModelFriday(
      id: 11,
      numberSunnah: 'Сунна 11',
      contentSunnah: 'Прочитать суру «Аль-Кахф»',
    ),
    ModelFriday(
      id: 12,
      numberSunnah: 'Сунна 12',
      contentSunnah: 'Как можно больше читать салават на Пророка ﷺ',
    ),
    ModelFriday(
      id: 13,
      numberSunnah: 'Сунна 13',
      contentSunnah: 'Сделать дуа в последний час пятницы\n(час до магриба)',
    ),
  ];

  final PageController _fridayController = PageController();

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final cdt = context.watch<RestTimeState>().getCdt;
    return cdt.weekday >= 2 && cdt.weekday <= 5
        ? AnimatedSize(
            duration: const Duration(milliseconds: 1250),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Card(
                  margin: AppWidgetStyle.horizontalMarginMini,
                  child: Padding(
                    padding: AppWidgetStyle.mainPaddingMini,
                    child: Text(
                      AppString.inFriday,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 150,
                  child: PageView.builder(
                    controller: _fridayController,
                    itemCount: _fridayContentList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FridayItem(
                        item: _fridayContentList[index],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: SmoothPageIndicator(
                    controller: _fridayController,
                    count: _fridayContentList.length,
                    onDotClicked: (index) => _fridayController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 50),
                      curve: Curves.bounceIn,
                    ),
                    effect: CustomizableEffect(
                      activeDotDecoration: DotDecoration(
                        color: appColors.firstAppColor,
                        dotBorder: DotBorder(
                          padding: 3,
                          color: appColors.secondAppColor,
                          width: 1,
                        ),
                        width: 8,
                        height: 8,
                        borderRadius: BorderRadius.circular(4),
                        rotationAngle: 45,
                      ),
                      dotDecoration: DotDecoration(
                        color: appColors.secondAppColor,
                        width: 3,
                        height: 3,
                        borderRadius: BorderRadius.circular(2.5),
                      ),
                      spacing: 6,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          )
        : const SizedBox();
  }
}
