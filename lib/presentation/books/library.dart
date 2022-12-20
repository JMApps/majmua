import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';

class Library extends StatelessWidget {
  const Library({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'library_page');
      },
      borderRadius: MainAppStyle.mainBorderRadius,
      child: Container(
        padding: MainAppStyle.mainPaddingMini,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            borderRadius: MainAppStyle.mainBorderRadius, color: Colors.white),
        constraints: const BoxConstraints(
          minHeight: 50,
        ),
        child: const Text(
          'Библиотека',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black87,
            shadows: [
              BoxShadow(
                color: Colors.indigo,
                blurRadius: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
