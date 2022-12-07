import 'package:flutter/material.dart';
import 'package:majmua/application/state/main_app_state.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/presentation/supplications/supplication_item.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ListSupplications extends StatelessWidget {
  const ListSupplications({
    Key? key,
    required this.isNight,
    required this.isDawn,
  }) : super(key: key);

  final bool isNight;
  final bool isDawn;

  @override
  Widget build(BuildContext context) {
    final readMainState = context.read<MainAppState>();
    return FutureBuilder(
      future: isNight
          ? readMainState.getDatabaseQuery.getNightSupplications(2)
          : readMainState.getDatabaseQuery.getDayNightSupplications(isDawn),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Column(
                children: [
                  const SizedBox(height: 16),
                  Expanded(
                    child: PageView.builder(
                      controller: readMainState.getSupplicationController,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SupplicationItem(
                          index: index + 1,
                          item: snapshot.data![index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  SmoothPageIndicator(
                    onDotClicked: (index) {
                      readMainState.supplicationControllerIndex = index;
                    },
                    controller: readMainState.getSupplicationController,
                    count: snapshot.data!.length,
                    effect: CustomizableEffect(
                      activeDotDecoration: DotDecoration(
                        color: Colors.deepPurple,
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
                        borderRadius: BorderRadius.circular(3),
                      ),
                      spacing: 6,
                    ),
                  ),
                  const SizedBox(height: 32),
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