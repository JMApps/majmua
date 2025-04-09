import 'package:flutter/material.dart';
import 'package:majmua/core/routes/app_route_names.dart';
import 'package:majmua/core/strings/app_string_constraints.dart';

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
            bookTitle: AppStringConstraints.theNamesOf,
            bookNumber: 1,
            bookColor: Colors.blue,
            routeName: AppRouteNames.pageNamesOfContent,
          ),
          LibraryBookItem(
            bookTitle: AppStringConstraints.questions200,
            bookNumber: 2,
            bookColor: Colors.green,
            routeName: '',
          ),
          LibraryBookItem(
            bookTitle: AppStringConstraints.hadith40,
            bookNumber: 3,
            bookColor: Colors.grey,
            routeName: '',
          ),
          LibraryBookItem(
            bookTitle: AppStringConstraints.lessonsRamadan,
            bookNumber: 4,
            bookColor: Colors.purple,
            routeName: '',
          ),
          LibraryBookItem(
            bookTitle: AppStringConstraints.raqaiqQuran,
            bookNumber: 5,
            bookColor: Colors.amber,
            routeName: '',
          ),
          LibraryBookItem(
            bookTitle: AppStringConstraints.strengthOfWill,
            bookNumber: 6,
            bookColor: Colors.indigo,
            routeName: '',
          ),
        ],
      ),
    );
  }
}
