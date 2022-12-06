import 'dart:math';

import 'package:flutter/material.dart';
import 'package:majmua/presentation/names/name_item.dart';

class ListNames extends StatefulWidget {
  const ListNames({Key? key}) : super(key: key);

  @override
  State<ListNames> createState() => _ListNamesState();
}

class _ListNamesState extends State<ListNames> {
  final _namesController =
      PageController(initialPage: Random().nextInt(99), viewportFraction: 0.65);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        const Text('Прекрасные имена Аллаха'),
        const SizedBox(height: 8),
        SizedBox(
          height: 100,
          child: PageView.builder(
            controller: _namesController,
            scrollDirection: Axis.horizontal,
            itemCount: 99,
            itemBuilder: (BuildContext context, int index) {
              return NameItem(index: index);
            },
          ),
        ),
      ],
    );
  }
}
