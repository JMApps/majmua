import 'package:flutter/material.dart';
import 'package:majmua/presentation/sixColumns/column_item.dart';

class SixColumnsContainer extends StatelessWidget {
  const SixColumnsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              ColumnItem(
                title: 'Утром',
                isLeft: false,
                routeName: 'day_supplications_page',
                imageName: 'sunrise',
              ),
              SizedBox(height: 8),
              ColumnItem(
                title: 'Вечером',
                isLeft: false,
                routeName: 'evening_supplications_page',
                imageName: 'sunset',
              ),
              SizedBox(height: 8),
              ColumnItem(
                title: 'Перед сном',
                isLeft: false,
                routeName: 'night_supplications_page',
                imageName: 'night',
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              ColumnItem(
                title: 'Сура Кахф',
                isLeft: true,
                routeName: 'surah_qahf_page',
                imageName: 'sunrise',
              ),
              SizedBox(height: 8),
              ColumnItem(
                title: 'Сура Власть',
                isLeft: true,
                routeName: 'surah_milk_page',
                imageName: 'sunrise',
              ),
              SizedBox(height: 8),
              ColumnItem(
                title: 'Мольбы из Корана',
                isLeft: true,
                routeName: 'supplications_from_quran_page',
                imageName: 'sunrise',
              ),
            ],
          ),
        ),
      ],
    );
  }
}