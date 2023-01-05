import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:majmua/application/state/country_coordinates_state.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:majmua/data/database/local/model/custom_country_model.dart';
import 'package:provider/provider.dart';

class CardChangeCity extends StatefulWidget {
  const CardChangeCity({Key? key, required this.item}) : super(key: key);

  final CustomCountryModel item;

  @override
  State<CardChangeCity> createState() => _CardChangeCityState();
}

class _CardChangeCityState extends State<CardChangeCity> {
  final _formCountryKey = GlobalKey<FormState>();
  final _formCityKey = GlobalKey<FormState>();
  final _formLatitudeKey = GlobalKey<FormState>();
  final _formLongitudeKey = GlobalKey<FormState>();

  late final TextEditingController _countryController;
  late final TextEditingController _cityController;
  late final TextEditingController _latitudeController;
  late final TextEditingController _longitudeController;

  @override
  void initState() {
    _countryController = TextEditingController(text: widget.item.country);
    _cityController = TextEditingController(text: widget.item.city);
    _latitudeController = TextEditingController(text: widget.item.latitude);
    _longitudeController = TextEditingController(text: widget.item.longitude);
    super.initState();
  }

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
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      labelText: 'Название страны',
                      border: AppStyles.mainTextFieldBorder,
                      focusedBorder: AppStyles.mainFocusedTextFiledBorder(
                        focusInputColor: appColors.secondAppColor,
                      ),
                      errorBorder: AppStyles.mainErrorTextFiledBorder(
                        errorInputColor: appColors.thirdAppColor,
                      ),
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
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      labelText: 'Название города',
                      border: AppStyles.mainTextFieldBorder,
                      focusedBorder: AppStyles.mainFocusedTextFiledBorder(
                        focusInputColor: appColors.secondAppColor,
                      ),
                      errorBorder: AppStyles.mainErrorTextFiledBorder(
                        errorInputColor: appColors.thirdAppColor,
                      ),
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
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      labelText: 'Широта',
                      border: AppStyles.mainTextFieldBorder,
                      focusedBorder: AppStyles.mainFocusedTextFiledBorder(
                        focusInputColor: appColors.secondAppColor,
                      ),
                      errorBorder: AppStyles.mainErrorTextFiledBorder(
                        errorInputColor: appColors.thirdAppColor,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty && !RegExp(r'^[0-9.]+').hasMatch(value)) {
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
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      labelText: 'Долгота',
                      border: AppStyles.mainTextFieldBorder,
                      focusedBorder: AppStyles.mainFocusedTextFiledBorder(
                        focusInputColor: appColors.secondAppColor,
                      ),
                      errorBorder: AppStyles.mainErrorTextFiledBorder(
                        errorInputColor: appColors.thirdAppColor,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty && !RegExp(r'^[0-9.]+').hasMatch(value)) {
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
                      if (widget.item.country != _countryController.text ||
                          widget.item.city != _cityController.text ||
                          widget.item.latitude != _latitudeController.text ||
                          widget.item.longitude != _longitudeController.text) {
                        countryCoordinatesState.updateCountry(
                          idCountry: widget.item.id,
                          country: _countryController.text,
                          city: _cityController.text,
                          latitude: _latitudeController.text,
                          longitude: _longitudeController.text,
                        );
                        context.read<CountryCoordinatesState>().changeCustomCountry = CustomCountryModel(
                          id: widget.item.id,
                          country: _countryController.text,
                          city: _cityController.text,
                          latitude: _latitudeController.text,
                          longitude: _longitudeController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          AppStyles.snackBar(
                            'Изменено',
                            appColors.firstAppColor,
                          ),
                        );
                        Navigator.pop(context);
                      } else {
                        Navigator.pop(context);
                      }
                    }
                  },
                  shape: AppStyles.mainCardBorderRadius,
                  color: appColors.secondAppColor,
                  child: const Text(
                    'Изменить',
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