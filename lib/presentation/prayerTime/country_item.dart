import 'package:flutter/material.dart';
import 'package:majmua/application/state/country_coordinates_state.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/data/database/local/model/country_model.dart';
import 'package:provider/provider.dart';

class CountryItem extends StatelessWidget {
  const CountryItem({
    Key? key,
    required this.cityIndex,
    required this.countryModelItem,
  }) : super(key: key);

  final int cityIndex;
  final CountryModel countryModelItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.read<CountryCoordinatesState>().changeCountry = countryModelItem;
        Navigator.of(context).pop();
      },
      visualDensity: const VisualDensity(vertical: -2),
      contentPadding: AppStyles.symmetricHorizontalPadding,
      leading: CircleAvatar(
        radius: 15,
        child: Text(
          '${cityIndex + 1}',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
      title: Text(
        countryModelItem.city,
        style: const TextStyle(
          fontSize: 22,
        ),
      ),
      subtitle: Text(
        countryModelItem.country,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.grey,
        ),
      ),
    );
  }
}