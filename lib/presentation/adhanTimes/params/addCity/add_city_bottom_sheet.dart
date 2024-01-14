import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/domain/entities/custom_city_entity.dart';
import 'package:majmua/presentation/state/custom_cities_state.dart';
import 'package:majmua/presentation/state/input_add_city_state.dart';
import 'package:majmua/presentation/widgets/params_desc_rich_text.dart';
import 'package:provider/provider.dart';

class AddCityBottomSheet extends StatefulWidget {
  const AddCityBottomSheet({
    super.key,
    required this.state,
  });

  final CustomCitiesState state;

  @override
  State<AddCityBottomSheet> createState() => _AddCityBottomSheetState();
}

class _AddCityBottomSheetState extends State<AddCityBottomSheet> {
  final _formCountryKey = GlobalKey<FormState>();
  final _formCityKey = GlobalKey<FormState>();
  final _formLatitudeKey = GlobalKey<FormState>();
  final _formLongitudeKey = GlobalKey<FormState>();

  final _countryController = TextEditingController();
  final _cityController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();

  final FocusNode _focusCountry = FocusNode();
  final FocusNode _focusCity = FocusNode();
  final FocusNode _focusLatitude = FocusNode();
  final FocusNode _focusLongitude = FocusNode();

  bool checkForEmpty() {
    return _countryController.text.trim().isNotEmpty &&
        _cityController.text.trim().isNotEmpty &&
        _latitudeController.text.trim().isNotEmpty &&
        _longitudeController.text.trim().isNotEmpty;
  }

  bool checkForValidate() {
    return _formCountryKey.currentState!.validate() &&
        _formCityKey.currentState!.validate() &&
        _formLatitudeKey.currentState!.validate() &&
        _formLongitudeKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => InputAddCityState(),
        ),
      ],
      child: SingleChildScrollView(
        padding: AppStyles.mardingHorizontal,
        child: Consumer<InputAddCityState>(
          builder: (BuildContext context, InputAddCityState inputState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Form(
                  key: _formCountryKey,
                  child: TextFormField(
                    focusNode: _focusCountry,
                    controller: _countryController,
                    autofocus: true,
                    autocorrect: false,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: appLocale!.inputCountryName,
                      errorText: inputState.getInputCountry
                          ? appLocale.inputCountryName
                          : null,
                    ),
                    onChanged: (String country) {
                      inputState.setInputCountry = country;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return appLocale.inputCountryName;
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Form(
                  key: _formCityKey,
                  child: TextFormField(
                    focusNode: _focusCity,
                    controller: _cityController,
                    autofocus: false,
                    autocorrect: false,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: appLocale.inputCityName,
                      errorText: inputState.getInputCity
                          ? appLocale.inputCityName
                          : null,
                    ),
                    onChanged: (String city) {
                      inputState.setInputCity = city;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return appLocale.inputCityName;
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Form(
                  key: _formLatitudeKey,
                  child: TextFormField(
                    focusNode: _focusLatitude,
                    controller: _latitudeController,
                    autofocus: false,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^[0-9.-]+'))
                    ],
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: appLocale.inputLatitude,
                      errorText: inputState.getInputLatitude
                          ? appLocale.inputLatitude
                          : null,
                    ),
                    onChanged: (String latitude) {
                      inputState.setInputLatitude = latitude;
                    },
                    validator: (value) {
                      if (value!.isEmpty && !RegExp(r'^[0-9.]+').hasMatch(value)) {
                        return appLocale.inputLatitude;
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Form(
                  key: _formLongitudeKey,
                  child: TextFormField(
                    focusNode: _focusLongitude,
                    controller: _longitudeController,
                    autofocus: false,
                    autocorrect: false,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^[0-9.-]+'))
                    ],
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: appLocale.inputLongitude,
                      errorText: inputState.getInputLongitude ? appLocale.inputLongitude : null,
                    ),
                    onChanged: (String longitude) {
                      inputState.setInputLongitude = longitude;
                    },
                    validator: (value) {
                      if (value!.isEmpty && !RegExp(r'^[0-9.]+').hasMatch(value)) {
                        return appLocale.inputLongitude;
                      }
                      return null;
                    },
                  ),
                ),
                Text(
                  appLocale.addCityInformation,
                  textAlign: TextAlign.center,
                ),
                ParamsDescRichText(
                  firstText: '${appLocale.country}: ',
                  secondText: appLocale.countryName,
                ),
                ParamsDescRichText(
                  firstText: '${appLocale.city}: ',
                  secondText: appLocale.cityName,
                ),
                ParamsDescRichText(
                  firstText: appLocale.latitude,
                  secondText: '21.3924',
                ),
                ParamsDescRichText(
                  firstText: appLocale.longitude,
                  secondText: '39.8579',
                ),
                FilledButton.tonal(
                  onPressed: () {
                    if (checkForEmpty()) {
                      if (checkForValidate()) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: appColors.quaternaryColor,
                            duration: const Duration(milliseconds: 1750),
                            content: Text(
                              appLocale.cityAdded,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Nexa',
                              ),
                            ),
                          ),
                        );
                        widget.state.addCustomCity(
                          model: CustomCityEntity(
                            id: 0,
                            country: _countryController.text.trim(),
                            city: _cityController.text.trim(),
                            latitude: _latitudeController.text.trim(),
                            longitude: _longitudeController.text.trim(),
                          ),
                        );
                      }
                    } else if (_countryController.text.trim().isEmpty) {
                      inputState.setInputCountry = '';
                      _focusCountry.requestFocus();
                    } else if (_cityController.text.trim().isEmpty) {
                      inputState.setInputCity = '';
                      _focusCity.requestFocus();
                    } else if (_latitudeController.text.trim().isEmpty) {
                      inputState.setInputLatitude = '';
                      _focusLatitude.requestFocus();
                    } else if (_longitudeController.text.trim().isEmpty) {
                      inputState.setInputLongitude = '';
                      _focusLongitude.requestFocus();
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(appColors.quaternaryColor),
                  ),
                  child: Text(
                    appLocale.add,
                    style: TextStyle(
                      fontSize: 16,
                      color: appColors.surface,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            );
          },
        ),
      ),
    );
  }
}
