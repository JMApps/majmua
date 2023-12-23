import 'package:flutter/material.dart';

class GemsPage extends StatefulWidget {
  const GemsPage({super.key});

  @override
  State<GemsPage> createState() => _GemsPageState();
}

class _GemsPageState extends State<GemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Жемчужины Тарифи'),
      ),
      body: Container(),
    );
  }
}
