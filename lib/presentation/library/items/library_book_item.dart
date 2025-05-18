import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/styles/app_styles.dart';

class LibraryBookItem extends StatelessWidget {
  const LibraryBookItem({
    super.key,
    required this.bookTitle,
    required this.bookNumber,
    required this.bookColor,
    required this.routeName,
  });

  final String bookTitle;
  final int bookNumber;
  final Color bookColor;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        HapticFeedback.lightImpact();
        Navigator.pushNamed(context, routeName);
      },
      title: Text(bookTitle),
      shape: AppStyles.mainShape,
      visualDensity: VisualDensity(vertical: -2, horizontal: -4),
      contentPadding: AppStyles.mardingHorizontalMini,
      horizontalTitleGap: 16,
      leading: CircleAvatar(
        backgroundColor: bookColor.withAlpha(175),
        child: Padding(
          padding: AppStyles.mardingTopMicroMini,
          child: Text(
            bookNumber.toString(),
          ),
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
