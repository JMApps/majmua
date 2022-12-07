import 'package:flutter/material.dart';
import 'package:majmua/presentation/supplications/list_supplications.dart';

class SupplicationPage extends StatelessWidget {
  const SupplicationPage({
    Key? key,
    required this.title,
    required this.isNight,
    required this.isDawn,
  }) : super(key: key);

  final String title;
  final bool isNight;
  final bool isDawn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8EAF6),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: Text(title),
      ),
      body: ListSupplications(
        isNight: isNight,
        isDawn: isDawn,
      ),
    );
  }
}
