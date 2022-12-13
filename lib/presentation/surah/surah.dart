import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';

class Surah extends StatelessWidget {
  const Surah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        const Text(
          'Коран',
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
                    color: Color(0xFF263238),
                    fontSize: 16,
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
                    color: Color(0xFFEFEBE9),
                    fontSize: 16,
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
              Navigator.pushNamed(context, 'supplications_from_quran');
            },
            child: Card(
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: MainAppStyle.mainBorderRadius,
              ),
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
                    color: Color(0xFFFBE9E7),
                    fontSize: 16,
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
