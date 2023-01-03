import 'package:flutter/material.dart';

class AddPrayerCoordinatesCityPage extends StatelessWidget {
  const AddPrayerCoordinatesCityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить свой город'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 0,
        child: const Icon(Icons.add),
      ),
      body: Container(),
    );
  }
}
