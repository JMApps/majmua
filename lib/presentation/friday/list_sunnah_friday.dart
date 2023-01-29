import 'package:flutter/material.dart';
import 'package:majmua/application/state/prayer_time_state.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/data/database/models/model_friday.dart';
import 'package:majmua/presentation/friday/friday_item.dart';
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
      numberSunnah: 'Желательно',
      contentSunnah: 'Совершить большое омовение',
    ),
    ModelFriday(
      id: 2,
      numberSunnah: 'Желательно',
      contentSunnah: 'Привести себя в порядок',
    ),
    ModelFriday(
      id: 3,
      numberSunnah: 'Желательно',
      contentSunnah: 'Надеть чистую одежду',
    ),
    ModelFriday(
      id: 4,
      numberSunnah: 'Желательно',
      contentSunnah: 'Умастить себя благовониями',
    ),
    ModelFriday(
      id: 5,
      numberSunnah: 'Желательно',
      contentSunnah: 'Пораньше отправиться в мечеть',
    ),
    ModelFriday(
      id: 6,
      numberSunnah: 'Желательно',
      contentSunnah: 'Отправиться в мечеть пешком',
    ),
    ModelFriday(
      id: 7,
      numberSunnah: 'Желательно',
      contentSunnah: 'Занять место ближе к минбару',
    ),
    ModelFriday(
      id: 8,
      numberSunnah: 'Запрещено (харам)',
      contentSunnah:
          'Перешагивать через других, если только иначе не добраться до нужного места',
    ),
    ModelFriday(
      id: 9,
      numberSunnah: 'Запрещено (харам)',
      contentSunnah: 'Разговаривать во время хутбы',
    ),
    ModelFriday(
      id: 10,
      numberSunnah: 'Желательно',
      contentSunnah:
          'Совершить 4 ракаата, (2 по 2), после джума в мечети или 2 ракаата дома',
    ),
    ModelFriday(
      id: 11,
      numberSunnah: 'Желательно',
      contentSunnah: 'Прочитать суру «Аль-Кахф»',
    ),
    ModelFriday(
      id: 12,
      numberSunnah: 'Желательно',
      contentSunnah: 'Как можно больше читать салават на Пророка ﷺ',
    ),
    ModelFriday(
      id: 13,
      numberSunnah: 'Желательно',
      contentSunnah: 'Сделать дуа в последний час пятницы\n(час до магриба)',
    ),
  ];

  final PageController _fridayController = PageController();

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final bool isFriday = context.watch<PrayerTimeState>().getFridayState;
    return AnimatedSize(
      duration: const Duration(milliseconds: 2500),
      curve: Curves.easeInOutCubic,
      child: isFriday
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                    effect: WormEffect(
                      spacing: 5,
                      dotHeight: 4,
                      dotWidth: 12,
                      activeDotColor: appColors.thirdAppColor,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            )
          : const SizedBox(),
    );
  }
}
