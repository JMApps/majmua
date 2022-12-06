import 'package:flutter/material.dart';

class HadeethItem extends StatelessWidget {
  const HadeethItem({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Text('Hadeeth $index'),
      ),
    );
  }
}
