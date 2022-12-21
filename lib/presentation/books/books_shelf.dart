import 'package:flutter/material.dart';
import 'package:majmua/presentation/books/book_item.dart';

class BooksShelf extends StatelessWidget {
  const BooksShelf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        children: const [
          BookItem(
            routeName: 'page_names_of',
            title: 'Толкование прекрасных имён Аллаха',
            subTitle: 'В свете Корана и Сунны',
            color: Colors.blue,
            bookNumber: 1,
          ),
          SizedBox(height: 8),
          BookItem(
            routeName: 'questions_list_page',
            title: '200 вопросов',
            subTitle: 'По вероучению Ислама',
            color: Colors.teal,
            bookNumber: 2,
          ),
          SizedBox(height: 8),
          BookItem(
            routeName: 'lessons_ramadan_list_page',
            title: 'Уроки Рамадана',
            subTitle: 'Пост и его значение',
            color: Colors.deepPurple,
            bookNumber: 3,
          ),
          SizedBox(height: 8),
          BookItem(
            routeName: 'list_hadeeths_page',
            title: '40 хадисов',
            subTitle: 'Имама ан-Навави',
            color: Colors.grey,
            bookNumber: 4,
          ),
          SizedBox(height: 8),
          BookItem(
            routeName: 'list_raqaiq_page',
            title: 'Смягчение сердец Кораном',
            subTitle: 'Ракъаикъ Къуран',
            color: Colors.orange,
            bookNumber: 5,
          ),
        ],
      ),
    );
  }
}
