import 'package:flutter/material.dart';
import 'package:majmua/application/state/country_coordinates_state.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/data/database/local/model/country_model.dart';
import 'package:provider/provider.dart';

class CountyItem extends StatelessWidget {
  const CountyItem({
    Key? key,
    required this.countryModelItem,
  }) : super(key: key);

  final CountryModel countryModelItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.read<CountryCoordinatesState>().changeCountry = countryModelItem;
        Navigator.pop(context);
      },
      visualDensity: const VisualDensity(vertical: -2),
      contentPadding: AppStyles.symmetricHorizontalPadding,
      title: Text(countryModelItem.city, style: const TextStyle(fontSize: 22,),),
      subtitle: Text(countryModelItem.country, style: const TextStyle(fontSize: 20,),),
    );
  }
}
