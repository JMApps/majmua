import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/presentation/friday/model_friday.dart';

class FridayItem extends StatelessWidget {
  const FridayItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ModelFriday item;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: AppStyles.mainCardBorderRadius,
      color: item.id.isOdd ? Colors.indigo : Colors.teal,
      child: Card(
        margin: const EdgeInsets.only(left: 8),
        elevation: 0,
        shape: AppStyles.mainCardBorderRadius,
        child: Center(
          child: ListTile(
            dense: true,
            visualDensity: const VisualDensity(vertical: -4),
            contentPadding: AppStyles.symmetricHorizontalPaddingMini,
            title: Text(
              item.numberSunnah,
              style: AppStyles.mainFontSizeStyle,
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              item.contentSunnah,
              style: AppStyles.mainFontSizeStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
