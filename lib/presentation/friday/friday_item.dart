import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:majmua/presentation/friday/model_friday.dart';

class FridayItem extends StatelessWidget {
  const FridayItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ModelFriday item;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(left: 8),
      elevation: 0,
      shape: AppStyles.mainCardBorderRadius,
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          borderRadius: AppStyles.mainBorderRadius,
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            opacity: 0.075,
            colorFilter: ColorFilter.mode(
              Colors.indigo,
              BlendMode.srcATop,
            ),
            image: AssetImage(
              'assets/images/background_item.png',
            ),
          ),
        ),
        child: ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: -4),
          contentPadding: AppStyles.symmetricHorizontalPaddingMini,
          title: Text(
            item.numberSunnah,
            style: TextStyle(
              fontSize: 16,
              color: appColors.thirdAppColor,
            ),
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            item.contentSunnah,
            style: const TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
