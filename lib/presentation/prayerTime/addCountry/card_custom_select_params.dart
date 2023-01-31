import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/state/prayer_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/data/database/models/custom_country_model.dart';
import 'package:majmua/presentation/prayerTime/addCountry/card_change_city.dart';
import 'package:majmua/presentation/prayerTime/addCountry/card_delete_city.dart';
import 'package:provider/provider.dart';

class CardCustomSelectParams extends StatelessWidget {
  const CardCustomSelectParams({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CustomCountryModel item;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      color: appColors.mainReverse,
      margin: AppWidgetStyle.mainMargin,
      child: Padding(
        padding: AppWidgetStyle.mainPadding,
        child: Consumer<PrayerTimeState>(
          builder: (BuildContext context, prayerTimeState, _) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pop();
                    prayerTimeState.setCountry = item.country;
                    prayerTimeState.setCity = item.city;
                    prayerTimeState.setCoordinates = Coordinates(
                      double.parse(item.latitude).abs(),
                      double.parse(item.longitude).abs(),
                    );
                  },
                  shape: AppWidgetStyle.mainRectangleBorder,
                  visualDensity: const VisualDensity(vertical: -4),
                  title: const Text(
                    AppString.select,
                    textAlign: TextAlign.start,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 20,
                    color: appColors.firstAppColor,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      context: context,
                      builder: (ctx) => AnimatedPadding(
                        padding: MediaQuery.of(ctx).viewInsets,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.decelerate,
                        child: CardChangeCity(item: item),
                      ),
                    );
                  },
                  shape: AppWidgetStyle.mainRectangleBorder,
                  visualDensity: const VisualDensity(vertical: -4),
                  title: const Text(
                    AppString.change,
                    textAlign: TextAlign.start,
                  ),
                  trailing: Icon(
                    Icons.edit,
                    size: 20,
                    color: appColors.secondAppColor,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (_) => CardDeleteCity(idCity: item.id),
                    );
                  },
                  shape: AppWidgetStyle.mainRectangleBorder,
                  visualDensity: const VisualDensity(vertical: -4),
                  title: const Text(
                    AppString.delete,
                    textAlign: TextAlign.start,
                  ),
                  trailing: Icon(
                    Icons.delete,
                    size: 20,
                    color: appColors.thirdAppColor,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
