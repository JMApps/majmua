import 'package:flutter/material.dart';
import 'package:majmua/application/state/country_coordinates_state.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:majmua/data/database/local/model/custom_country_model.dart';
import 'package:majmua/presentation/prayerTime/addCity/card_change_city.dart';
import 'package:provider/provider.dart';

class AddCityItem extends StatelessWidget {
  const AddCityItem({
    Key? key,
    required this.item,
    required this.cityIndex,
  }) : super(key: key);

  final CustomCountryModel item;
  final int cityIndex;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return ListTile(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (_) => Card(
            elevation: 0,
            shape: AppStyles.mainCardBorderRadius,
            margin: AppStyles.mainMargin,
            child: SingleChildScrollView(
              padding: AppStyles.mainPadding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    onTap: () {
                      context.read<CountryCoordinatesState>().changeCustomCountry = item;
                      Navigator.of(context).pop();
                      Navigator.pop(context);
                    },
                    shape: AppStyles.mainCardBorderRadius,
                    title: const Text(
                      'Выбрать',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: appColors.firstAppColor,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) => AnimatedPadding(
                          padding: MediaQuery.of(context).viewInsets,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.decelerate,
                          child: CardChangeCity(item: item),
                        ),
                      );
                    },
                    shape: AppStyles.mainCardBorderRadius,
                    title: const Text(
                      'Изменить',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    trailing: Icon(
                      Icons.edit,
                      color: appColors.firstAppColor,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (_) => Card(
                          elevation: 0,
                          shape: AppStyles.mainCardBorderRadius,
                          margin: AppStyles.mainMargin,
                          child: Padding(
                            padding: AppStyles.mainPadding,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ListTile(
                                  onTap: () {
                                    context.read<CountryCoordinatesState>().deleteCountry(item.id);
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      AppStyles.snackBar(
                                        'Удалено',
                                        appColors.firstAppColor,
                                      ),
                                    );
                                  },
                                  shape: AppStyles.mainCardBorderRadius,
                                  title: const Text(
                                    'Удалить',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  trailing: Icon(
                                    Icons.delete,
                                    color: appColors.firstAppColor,
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  shape: AppStyles.mainCardBorderRadius,
                                  title: const Text(
                                    'Отмена',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  trailing: Icon(
                                    Icons.cancel_outlined,
                                    color: appColors.firstAppColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    shape: AppStyles.mainCardBorderRadius,
                    title: const Text(
                      'Удалить',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    trailing: Icon(
                      Icons.delete,
                      color: appColors.firstAppColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
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
        item.city,
        style: const TextStyle(
          fontSize: 22,
        ),
      ),
      subtitle: Text(
        item.country,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.grey,
        ),
      ),
    );
  }
}
