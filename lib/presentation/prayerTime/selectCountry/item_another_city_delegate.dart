import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/state/prayer_time_state.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/data/database/models/default_country_model.dart';
import 'package:provider/provider.dart';

class ItemAnotherCityDelegate extends StatelessWidget {
  const ItemAnotherCityDelegate({
    Key? key,
    required this.index,
    required this.item,
  }) : super(key: key);

  final int index;
  final DefaultCountryModel item;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return ListTile(
      onTap: () {
        context.read<PrayerTimeState>().setCoordinates = Coordinates(
          double.parse(item.latitude).abs(),
          double.parse(item.longitude).abs(),
        );
        context.read<PrayerTimeState>().setCountry = item.country;
        context.read<PrayerTimeState>().setCity = item.city;
        Navigator.pop(context);
        Navigator.of(context).pop();
      },
      visualDensity: const VisualDensity(vertical: -4),
      leading: item.iso3 != null
          ? CircleAvatar(
              backgroundColor: appColors.thirdAppColor,
              radius: 25,
              child: Text(
                item.iso3!,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : const SizedBox(),
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
