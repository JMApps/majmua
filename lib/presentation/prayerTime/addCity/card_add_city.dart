import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:majmua/application/state/country_coordinates_state.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:majmua/data/database/local/model/custom_country_model.dart';
import 'package:provider/provider.dart';

class CardAddCity extends StatefulWidget {
  const CardAddCity({Key? key}) : super(key: key);

  @override
  State<CardAddCity> createState() => _CardAddCityState();
}

class _CardAddCityState extends State<CardAddCity> {
  final _formCountryKey = GlobalKey<FormState>();
  final _formCityKey = GlobalKey<FormState>();
  final _formLatitudeKey = GlobalKey<FormState>();
  final _formLongitudeKey = GlobalKey<FormState>();

  final _countryController = TextEditingController();
  final _cityController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Consumer<CountryCoordinatesState>(
      builder: (BuildContext context, countryCoordinatesState, _) {
        return Card(
          elevation: 0,
          shape: AppStyles.mainCardBorderRadius,
          margin: AppStyles.mainMargin,
          child: SingleChildScrollView(
            padding: AppStyles.mainPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: _formCountryKey,
                  child: TextFormField(
                    controller: _countryController,
                    autofocus: true,
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.center,
                    decoration: AppStyles.mainInputDecoration(
                      labelText: 'Название страны',
                      hintColor: appColors.firstAppColor,
                      focusInputColor: appColors.secondAppColor,
                      errorInputColor: appColors.thirdAppColor,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Введите название страны';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Form(
                  key: _formCityKey,
                  child: TextFormField(
                    controller: _cityController,
                    autofocus: false,
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.center,
                    decoration: AppStyles.mainInputDecoration(
                      labelText: 'Название города',
                      hintColor: appColors.firstAppColor,
                      focusInputColor: appColors.secondAppColor,
                      errorInputColor: appColors.thirdAppColor,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Введите название города';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Form(
                  key: _formLatitudeKey,
                  child: TextFormField(
                    controller: _latitudeController,
                    autofocus: false,
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^[0-9.-]+'))
                    ],
                    textAlign: TextAlign.center,
                    decoration: AppStyles.mainInputDecoration(
                      labelText: 'Широта',
                      hintColor: appColors.firstAppColor,
                      focusInputColor: appColors.secondAppColor,
                      errorInputColor: appColors.thirdAppColor,
                    ),
                    validator: (value) {
                      if (value!.isEmpty &&
                          !RegExp(r'^[0-9.]+').hasMatch(value)) {
                        return 'Введите широту разделив точкой';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Form(
                  key: _formLongitudeKey,
                  child: TextFormField(
                    controller: _longitudeController,
                    autofocus: false,
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^[0-9.-]+'))
                    ],
                    textAlign: TextAlign.center,
                    decoration: AppStyles.mainInputDecoration(
                      labelText: 'Долгота',
                      hintColor: appColors.firstAppColor,
                      focusInputColor: appColors.secondAppColor,
                      errorInputColor: appColors.thirdAppColor,
                    ),
                    validator: (value) {
                      if (value!.isEmpty &&
                          !RegExp(r'^[0-9.]+').hasMatch(value)) {
                        return 'Введите широту разделив точкой';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Чтобы программа могла рассчитать время молитв, вводимые коррдинаты должны быть корректными. Например:\nШирота: 21.3924\nДолгота: 39.8579',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                MaterialButton(
                  onPressed: () {
                    if (_formCountryKey.currentState!.validate() &&
                        _formCityKey.currentState!.validate() &&
                        _formLatitudeKey.currentState!.validate() &&
                        _formLongitudeKey.currentState!.validate()) {
                      countryCoordinatesState.createCountry(
                        item: CustomCountryModel(
                          country: _countryController.text,
                          city: _cityController.text,
                          latitude: _latitudeController.text,
                          longitude: _longitudeController.text,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  shape: AppStyles.mainCardBorderRadius,
                  color: appColors.secondAppColor,
                  child: const Text(
                    'Добавить',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
