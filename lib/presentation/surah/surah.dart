import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';

class Surah extends StatelessWidget {
  const Surah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        const Text(
          'Суры',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            splashColor: const Color(0xFF7986CB),
            borderRadius: MainAppStyle.mainBorderRadius,
            onTap: () {
              Navigator.pushNamed(context, 'surah_kahf');
            },
            child: Card(
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: MainAppStyle.mainBorderRadius,
              ),
              child: Container(
                padding: MainAppStyle.mainPadding,
                alignment: Alignment.centerRight,
                decoration: const BoxDecoration(
                  borderRadius: MainAppStyle.mainBorderRadius,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/ic_cave.jpg'),
                  ),
                ),
                child: const Text(
                  'Переща',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            splashColor: const Color(0xFF7986CB),
            borderRadius: MainAppStyle.mainBorderRadius,
            onTap: () {
              Navigator.pushNamed(context, 'surah_mulk');
            },
            child: Card(
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: MainAppStyle.mainBorderRadius,
              ),
              child: Container(
                padding: MainAppStyle.mainPadding,
                alignment: Alignment.centerRight,
                decoration: const BoxDecoration(
                  borderRadius: MainAppStyle.mainBorderRadius,
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/ic_al_mulk.jpg'),
                  ),
                ),
                child: const Text(
                  'Власть',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
