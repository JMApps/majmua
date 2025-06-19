import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/strings/db_value_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/city_state.dart';

class AddCityBottomSheet extends StatefulWidget {
  const AddCityBottomSheet({
    super.key,
    required this.cityState,
  });

  final CityState cityState;

  @override
  State<AddCityBottomSheet> createState() => _AddCityBottomSheetState();
}

class _AddCityBottomSheetState extends State<AddCityBottomSheet> {
  late final TextEditingController _countryController;
  late final TextEditingController _cityController;
  late final TextEditingController _latitudeController;
  late final TextEditingController _longitudeController;

  @override
  void initState() {
    super.initState();
    _countryController = TextEditingController();
    _cityController = TextEditingController();
    _latitudeController = TextEditingController();
    _longitudeController = TextEditingController();
  }

  @override
  void dispose() {
    _countryController.dispose();
    _cityController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      padding: AppStyles.mardingWithoutTopMini,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            appLocale.addCityMessage,
            style: AppStyles.mainTextStyleMini,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          _buildTextField(
            controller: _countryController,
            autofocusState: true,
            placeholder: appLocale.enterCountryName,
            appColors: appColors,
          ),
          const SizedBox(height: 8),
          _buildTextField(
            controller: _cityController,
            autofocusState: false,
            placeholder: appLocale.enterCityName,
            appColors: appColors,
          ),
          const SizedBox(height: 8),
          _buildTextField(
            controller: _latitudeController,
            autofocusState: false,
            placeholder: appLocale.enterLatitude,
            appColors: appColors,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]*\.?[0-9]*')),
            ],
          ),
          const SizedBox(height: 8),
          _buildTextField(
            controller: _longitudeController,
            autofocusState: false,
            placeholder: appLocale.enterLongitude,
            appColors: appColors,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]*\.?[0-9]*')),
            ],
          ),
          const SizedBox(height: 8),
          FilledButton.tonal(
            onPressed: () {
              final country = _countryController.text.trim();
              final city = _cityController.text.trim();
              final latitude = _latitudeController.text.trim();
              final longitude = _longitudeController.text.trim();

              if (!_validateInput(
                country: country,
                city: city,
                latitude: latitude,
                longitude: longitude,
              )) {
                return;
              }

              Navigator.pop(context);
              final createCity = {
                DBValueStrings.dbCountry: country,
                DBValueStrings.dbCity: city,
                DBValueStrings.dbLatitude: latitude,
                DBValueStrings.dbLongitude: longitude,
              };
              widget.cityState.createCity(mapCity: createCity);
            },
            child: Text(
              appLocale.add,
              style: AppStyles.mainTextStyleMini,
            ),
          ),
        ],
      ),
    );
  }

  bool _validateInput({
    required String country,
    required String city,
    required String latitude,
    required String longitude,
  }) {
    if (country.isEmpty || city.isEmpty) return false;
    if (!areCoordinatesValid(latitude: latitude, longitude: longitude)) return false;
    return true;
  }

  bool areCoordinatesValid({required String latitude, required String longitude}) {
    final lat = double.tryParse(latitude);
    final lon = double.tryParse(longitude);
    if (lat == null || lon == null) {
      return false;
    }
    if (lat < -90.0 || lat > 90.0) {
      return false;
    }
    if (lon < -180.0 || lon > 180.0) {
      return false;
    }
    return true;
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required bool autofocusState,
    required String placeholder,
    required ColorScheme appColors,
    List<TextInputFormatter>? inputFormatters}) {
    return CupertinoTextField(
      controller: controller,
      autofocus: autofocusState,
      style: TextStyle(
        fontSize: 16.0,
        color: appColors.onSurface,
      ),
      placeholderStyle: TextStyle(
        fontSize: 16.0,
        color: appColors.secondary.withAlpha(150),
      ),
      placeholder: placeholder,
      clearButtonMode: OverlayVisibilityMode.editing,
      textCapitalization: TextCapitalization.sentences,
      textInputAction: TextInputAction.next,
      decoration: BoxDecoration(
        borderRadius: AppStyles.mainBorderMini,
        color: appColors.surface,
      ),
      inputFormatters: inputFormatters,
    );
  }
}