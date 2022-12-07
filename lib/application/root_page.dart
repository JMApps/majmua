import 'package:flutter/material.dart';
import 'package:majmua/presentation/pages/main_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ПМ',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MainPage(),
    );
  }
}
