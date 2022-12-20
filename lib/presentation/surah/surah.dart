import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';

class Surah extends StatelessWidget {
  const Surah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          splashColor: const Color(0xFF7986CB),
          borderRadius: MainAppStyle.mainBorderRadius,
          onTap: () {
            Navigator.pushNamed(context, 'surah_kahf');
          },
          child: Card(
            elevation: 0,
            shape: MainAppStyle.mainCardBorderRadius,
            child: Container(
              padding: MainAppStyle.mainPadding,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                borderRadius: MainAppStyle.mainBorderRadius,
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage('assets/images/ic_surah.jpg'),
                ),
              ),
              child: const Text(
                'Сура «Пещера»',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  shadows: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 12,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        InkWell(
          splashColor: const Color(0xFF7986CB),
          borderRadius: MainAppStyle.mainBorderRadius,
          onTap: () {
            Navigator.pushNamed(context, 'surah_mulk');
          },
          child: Card(
            elevation: 0,
            shape: MainAppStyle.mainCardBorderRadius,
            child: Container(
              padding: MainAppStyle.mainPadding,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                borderRadius: MainAppStyle.mainBorderRadius,
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage('assets/images/ic_surah_two.jpg'),
                ),
              ),
              child: const Text(
                'Сура «Власть»',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  shadows: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 12,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        InkWell(
          splashColor: const Color(0xFF7986CB),
          borderRadius: MainAppStyle.mainBorderRadius,
          onTap: () {
            Navigator.pushNamed(context, 'supplications_from_quran');
          },
          child: Card(
            elevation: 0,
            shape: MainAppStyle.mainCardBorderRadius,
            child: Container(
              padding: MainAppStyle.mainPadding,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                borderRadius: MainAppStyle.mainBorderRadius,
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage('assets/images/ic_supplication.jpg'),
                ),
              ),
              child: const Text(
                'Мольбы из Корана',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  shadows: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 12,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
