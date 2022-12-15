import 'package:flutter/material.dart';
import 'package:majmua/application/state/main_app_state.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/service/database_query.dart';
import 'package:majmua/presentation/friday/friday_item.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ListFriday extends StatefulWidget {
  const ListFriday({Key? key}) : super(key: key);

  @override
  State<ListFriday> createState() => _ListFridayState();
}

class _ListFridayState extends State<ListFriday> {
  final DatabaseQuery _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    final readMainState = context.read<MainAppState>();
    return FutureBuilder(
      future: _databaseQuery.getFridaySunnah(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'Желательные действия в день пятницы:',
                    style: MainAppStyle.mainTextSizeStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 216,
                    child: PageView.builder(
                      controller: readMainState.getFridayController,
                      itemCount: snapshot.data!.length,
                      onPageChanged: (index) {
                        readMainState.setFridaySunnahControllerIndex = index;
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return FridayItem(
                          item: snapshot.data[index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  SmoothPageIndicator(
                    onDotClicked: (index) {
                      readMainState.setFridaySunnahControllerIndex = index;
                    },
                    controller: readMainState.getFridayController,
                    count: snapshot.data!.length,
                    effect: CustomizableEffect(
                      activeDotDecoration: DotDecoration(
                        color: Colors.primaries[context.watch<MainAppState>().getFridaySunnahControllerIndex + 1],
                        dotBorder: const DotBorder(
                          padding: 2,
                          color: Colors.teal,
                          width: 2,
                        ),
                        width: 10,
                        height: 10,
                        borderRadius: BorderRadius.circular(4),
                        rotationAngle: 45,
                      ),
                      dotDecoration: DotDecoration(
                        color: const Color(0xFF4DB6AC),
                        width: 6,
                        height: 6,
                        borderRadius: BorderRadius.circular(2.5),
                      ),
                      spacing: 6,
                    ),
                  ),
                ],
              )
            : const Center(
                child: Padding(
                  padding: MainAppStyle.mainPadding,
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
      },
    );
  }
}
