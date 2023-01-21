import 'package:flutter/material.dart';
import 'package:majmua/data/database/models/custom_country_model.dart';
import 'package:majmua/presentation/prayerTime/addCountry/card_custom_select_params.dart';

class ItemAnotherCustomCity extends StatelessWidget {
  const ItemAnotherCustomCity({
    Key? key,
    required this.index,
    required this.item,
  }) : super(key: key);

  final int index;
  final CustomCountryModel item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (_) => CardCustomSelectParams(item: item),
        );
      },
      visualDensity: const VisualDensity(vertical: -4),
      title: Text(
        item.city,
        style: const TextStyle(
          fontSize: 22,
        ),
      ),
      subtitle: Text(
        item.country,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
