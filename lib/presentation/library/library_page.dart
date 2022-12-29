import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/presentation/library/book.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Библиотека'),
      ),
      body: SingleChildScrollView(
        padding: AppStyles.symmetricVerticalPadding,
        child: Column(
          children: const [
            Book(
              bookTitle: 'Толкование прекрасных имен Аллаха',
              bookSubTitle: 'В свете Корана и Сунны',
              bookColor: Color(0xFF2196F3),
              bookNumber: 1,
              routeName: 'names_of_page',
            ),
            Book(
              bookTitle: '200 вопросов',
              bookSubTitle: 'По вероучению Ислама',
              bookColor: Color(0xFF009688),
              bookNumber: 2,
              routeName: 'questions_page',
            ),
            Book(
              bookTitle: '40 хадисов',
              bookSubTitle: 'Имама ан-Навави',
              bookColor: Color(0xFF616161),
              bookNumber: 3,
              routeName: 'hadeeth_page',
            ),
            Book(
              bookTitle: 'Уроки Рамадана',
              bookSubTitle: 'Пост и его значение',
              bookColor: Color(0xFF9C27B0),
              bookNumber: 4,
              routeName: 'lessons_ramadan_page',
            ),
            Book(
              bookTitle: 'Смягчение сердец Кораном',
              bookSubTitle: 'Ракъаикъ Къуран',
              bookColor: Color(0xFFFF9800),
              bookNumber: 5,
              routeName: 'raqaiq_page',
            ),
          ],
        ),
      ),
    );
  }
}
