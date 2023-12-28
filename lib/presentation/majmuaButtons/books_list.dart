import 'package:flutter/material.dart';
import 'package:majmua/core/routes/route_names.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/presentation/majmuaButtons/book_item.dart';

class BooksList extends StatelessWidget {
  const BooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: AppStyles.mainMardingMini,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BookItem(
            title: 'Толкование прекрасных имён Аллаха',
            subTitle: 'В свете Корана и Сунны',
            bookNumber: 1,
            routeName: RouteNames.namesOfPage,
            color: Colors.blue,
          ),
          Divider(indent: 16, endIndent: 16),
          BookItem(
            title: '200 вопросов',
            subTitle: 'По вероучению Ислама',
            bookNumber: 2,
            routeName: RouteNames.questionsPage,
            color: Colors.teal,
          ),
          Divider(indent: 16, endIndent: 16),
          BookItem(
            title: '40 хадисов',
            subTitle: 'Имама ан-Навави',
            bookNumber: 3,
            routeName: RouteNames.hadeethsPage,
            color: Colors.black54,
          ),
          Divider(indent: 16, endIndent: 16),
          BookItem(
            title: 'Уроки Рамадана',
            subTitle: 'Пост и его значение',
            bookNumber: 4,
            routeName: RouteNames.lessonsPage,
            color: Colors.purple,
          ),
          Divider(indent: 16, endIndent: 16),
          BookItem(
            title: 'Ракъаикъ Къуран',
            subTitle: 'Смягчение сердец Кораном',
            bookNumber: 5,
            routeName: RouteNames.raqaiqPage,
            color: Colors.orange,
          ),
          Divider(indent: 16, endIndent: 16),
          BookItem(
            title: 'Сила воли',
            subTitle: '',
            bookNumber: 6,
            routeName: RouteNames.strengthPage,
            color: Colors.indigo,
          ),
          Divider(indent: 16, endIndent: 16),
        ],
      ),
    );
  }
}