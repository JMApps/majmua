import 'package:flutter/material.dart';
import 'package:majmua/presentation/friday/friday_item.dart';

class ListFriday extends StatefulWidget {
  const ListFriday({Key? key}) : super(key: key);

  @override
  State<ListFriday> createState() => _ListFridayState();
}

class _ListFridayState extends State<ListFriday> {
  final _fridayController = PageController(initialPage: 0, viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        SizedBox(
          height: 250,
          child: PageView.builder(
            controller: _fridayController,
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return FridayItem(
                index: index,
                cardColor: Colors.primaries[index * 2],
              );
            },
          ),
        ),
      ],
    );
  }
}
