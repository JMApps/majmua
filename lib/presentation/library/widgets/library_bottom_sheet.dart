import 'package:flutter/material.dart';

import '../../../core/styles/app_styles.dart';
import '../items/library_book_item.dart';

class LibraryBottomSheet extends StatelessWidget {
  const LibraryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: AppStyles.mardingWithoutTopMini,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LibraryBookItem(
            bookTitle: 'Имена Аллаха',
            bookNumber: 1,
            bookColor: Colors.blue,
            routeName: '',
          ),
          LibraryBookItem(
            bookTitle: '200 вопросов',
            bookNumber: 2,
            bookColor: Colors.green,
            routeName: '',
          ),
          LibraryBookItem(
            bookTitle: '40 хадисов',
            bookNumber: 3,
            bookColor: Colors.grey,
            routeName: '',
          ),
          LibraryBookItem(
            bookTitle: 'Уроки Рамадана',
            bookNumber: 4,
            bookColor: Colors.purple,
            routeName: '',
          ),
          LibraryBookItem(
            bookTitle: 'Ракъаикъ Къуран',
            bookNumber: 5,
            bookColor: Colors.amber,
            routeName: '',
          ),
          LibraryBookItem(
            bookTitle: 'Сила воли',
            bookNumber: 6,
            bookColor: Colors.indigo,
            routeName: '',
          ),
        ],
      ),
    );
  }
}
