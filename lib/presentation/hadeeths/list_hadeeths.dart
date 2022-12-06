import 'dart:math';

import 'package:flutter/material.dart';
import 'package:majmua/presentation/hadeeths/hadeeth_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ListHadeeths extends StatefulWidget {
  const ListHadeeths({Key? key}) : super(key: key);

  @override
  State<ListHadeeths> createState() => _ListHadeethsState();
}

class _ListHadeethsState extends State<ListHadeeths> {
  final _hadeethsController = PageController(initialPage: Random().nextInt(42), viewportFraction: 0.65);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        const Text('40 хадисов имама ан-Навави'),
        const SizedBox(height: 8),
        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: _hadeethsController,
            itemCount: 42,
            itemBuilder: (BuildContext context, int index) {
              return HadeethItem(index: index);
            },
          ),
        ),
        const SizedBox(height: 8),
        SmoothPageIndicator(
          controller: _hadeethsController,
          count: 42,
          effect: const ScrollingDotsEffect(
            maxVisibleDots: 11,
            dotWidth: 4,
            dotHeight: 12,
            dotColor: Color(0xFF4DB6AC),
            activeDotColor: Colors.deepOrange,
          ),
        ),
      ],
    );
  }
}
