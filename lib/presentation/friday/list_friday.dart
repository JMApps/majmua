import 'package:flutter/material.dart';
import 'package:majmua/application/state/main_app_state.dart';
import 'package:majmua/data/database/model/model_friday_item.dart';
import 'package:majmua/presentation/friday/friday_item.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ListFriday extends StatefulWidget {
  const ListFriday({Key? key}) : super(key: key);

  @override
  State<ListFriday> createState() => _ListFridayState();
}

class _ListFridayState extends State<ListFriday> {
  final _contentList = const <ModelFridayItem>[
    ModelFridayItem(
      id: 1,
      numberSunnah: 'Сунна 1',
      contentSunnah: 'Совершить полное (гъусль) омовение',
    ),
    ModelFridayItem(
      id: 2,
      numberSunnah: 'Сунна 2',
      contentSunnah: 'Привести себя в порядок',
    ),
    ModelFridayItem(
      id: 3,
      numberSunnah: 'Сунна 3',
      contentSunnah: 'Надеть чистую одежду',
    ),
    ModelFridayItem(
      id: 4,
      numberSunnah: 'Сунна 4',
      contentSunnah: 'Умастить себя благовониями',
    ),
    ModelFridayItem(
      id: 5,
      numberSunnah: 'Сунна 5',
      contentSunnah: 'Пораньше отправиться в мечеть',
    ),
    ModelFridayItem(
      id: 6,
      numberSunnah: 'Сунна 6',
      contentSunnah: 'Отправиться в мечеть пешком',
    ),
    ModelFridayItem(
      id: 7,
      numberSunnah: 'Сунна 7',
      contentSunnah: 'Занять место ближе к минбару',
    ),
    ModelFridayItem(
      id: 8,
      numberSunnah: 'Сунна 8',
      contentSunnah: 'Не перешагивать через других',
    ),
    ModelFridayItem(
      id: 9,
      numberSunnah: 'Сунна 9',
      contentSunnah: 'Не разговаривать во время хутбы',
    ),
    ModelFridayItem(
      id: 10,
      numberSunnah: 'Сунна 10',
      contentSunnah:
          'Совершить 4 ракаата (2 по 2) после джума в мечети или 2 ракаата дома',
    ),
    ModelFridayItem(
      id: 11,
      numberSunnah: 'Сунна 11',
      contentSunnah: 'Прочитать суру «Аль-Кахф»',
    ),
    ModelFridayItem(
      id: 12,
      numberSunnah: 'Сунна 12',
      contentSunnah:
          'Как можно больше читать салават на Пророка, да благословит его Аллах и да приветствует',
    ),
    ModelFridayItem(
      id: 13,
      numberSunnah: 'Сунна 13',
      contentSunnah: 'Сделать дуа в последний час пятницы (час до магриба)',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final readMainState = context.read<MainAppState>();
    return Column(
      children: [
        const SizedBox(height: 4),
        SizedBox(
          height: 175,
          child: PageView.builder(
            controller: readMainState.getFridayController,
            itemCount: _contentList.length,
            onPageChanged: (index) {
              readMainState.setFridaySunnahControllerIndex = index;
            },
            itemBuilder: (BuildContext context, int index) {
              return FridayItem(
                item: _contentList[index],
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        SmoothPageIndicator(
          onDotClicked: (index) {
            readMainState.setFridaySunnahControllerIndex = index;
          },
          controller: readMainState.getFridayController,
          count: _contentList.length,
          effect: CustomizableEffect(
            activeDotDecoration: DotDecoration(
              color: Colors.primaries[
                  context.watch<MainAppState>().getFridaySunnahControllerIndex + 1],
              dotBorder: const DotBorder(
                padding: 2,
                color: Colors.teal,
                width: 2,
              ),
              width: 8,
              height: 8,
              borderRadius: BorderRadius.circular(4),
              rotationAngle: 45,
            ),
            dotDecoration: DotDecoration(
              color: const Color(0xFF4DB6AC),
              width: 3,
              height: 3,
              borderRadius: BorderRadius.circular(2.5),
            ),
            spacing: 6,
          ),
        ),
      ],
    );
  }
}
