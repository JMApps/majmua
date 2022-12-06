import 'package:flutter/material.dart';

class FridayItem extends StatelessWidget {
  const FridayItem({Key? key, required this.index, required this.cardColor,})
      : super(key: key);

  final int index;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Transform.rotate(
        angle: 0.15,
        child: Card(
          color: cardColor,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Transform.rotate(
            angle: -0.15,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: Text('Sunnah $index'),
            ),
          ),
        ),
      ),
    );
  }
}
