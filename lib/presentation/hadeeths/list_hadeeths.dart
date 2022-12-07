import 'dart:math';

import 'package:flutter/material.dart';
import 'package:majmua/application/state/main_app_state.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/presentation/hadeeths/hadeeth_item.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ListHadeeths extends StatefulWidget {
  const ListHadeeths({Key? key}) : super(key: key);

  @override
  State<ListHadeeths> createState() => _ListHadeethsState();
}

class _ListHadeethsState extends State<ListHadeeths> {
  final _hadeethsController =
      PageController(initialPage: Random().nextInt(42), viewportFraction: 0.65);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<MainAppState>().getDatabaseQuery.getHadeeths(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Column(
                children: [
                  const SizedBox(height: 16),
                  const Text('40 хадисов имама ан-Навави'),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 150,
                    child: PageView.builder(
                      controller: _hadeethsController,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return HadeethItem(
                          index: index,
                          item: snapshot.data![index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  SmoothPageIndicator(
                    controller: _hadeethsController,
                    count: snapshot.data!.length,
                    effect: const ScrollingDotsEffect(
                      maxVisibleDots: 11,
                      dotWidth: 4,
                      dotHeight: 12,
                      dotColor: Color(0xFF4DB6AC),
                      activeDotColor: Colors.deepOrange,
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
