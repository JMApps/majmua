import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/model/arguments/arguments_supplication.dart';

class DayNightSupplications extends StatelessWidget {
  const DayNightSupplications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        const Text('Слова поминания Аллаха'),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  splashColor: const Color(0xFF4DB6AC),
                  borderRadius: MainAppStyle.mainBorderRadius,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      'supplication_page',
                      arguments: ArgumentsSupplication(
                        title: 'Утром',
                        isNight: false,
                        isDawn: true,
                      ),
                    );
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
                          image: AssetImage('assets/images/ic_dawn.jpg'),
                        ),
                      ),
                      child: const Text(
                        'Утром',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: const Color(0xFF4DB6AC),
                  borderRadius: MainAppStyle.mainBorderRadius,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      'supplication_page',
                      arguments: ArgumentsSupplication(
                        title: 'Вечером',
                        isNight: false,
                        isDawn: false,
                      ),
                    );
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
                          image: AssetImage('assets/images/ic_sunset.jpg'),
                        ),
                      ),
                      child: const Text(
                        'Вечером',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            splashColor: const Color(0xFF4DB6AC),
            borderRadius: MainAppStyle.mainBorderRadius,
            onTap: () {
              Navigator.pushNamed(
                context,
                'supplication_page',
                arguments: ArgumentsSupplication(
                  title: 'Перед сном',
                  isNight: true,
                  isDawn: false,
                ),
              );
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
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/ic_night.jpg'),
                  ),
                ),
                child: const Text(
                  'Перед сном',
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
