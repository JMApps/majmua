import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/strings/db_value_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/city_entity.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/city_state.dart';

class ChangeCityBottomSheet extends StatefulWidget {
  const ChangeCityBottomSheet({
    super.key,
    required this.cityModel,
    required this.cityState,
  });

  final CityEntity cityModel;
  final CityState cityState;

  @override
  State<ChangeCityBottomSheet> createState() => _ChangeCityBottomSheetState();
}

class _ChangeCityBottomSheetState extends State<ChangeCityBottomSheet> {
  late final TextEditingController _countryController;
  late final TextEditingController _cityController;
  late final TextEditingController _latitudeController;
  late final TextEditingController _longitudeController;

  @override
  void initState() {
    super.initState();
    _countryController = TextEditingController(text: widget.cityModel.country);
    _cityController = TextEditingController(text: widget.cityModel.city);
    _latitudeController = TextEditingController(text: widget.cityModel.latitude);
    _longitudeController = TextEditingController(text: widget.cityModel.longitude);
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
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 8),
          _buildTextField(
            controller: _cityController,
            autofocusState: false,
            placeholder: appLocale.enterCityName,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 8),
          _buildTextField(
            controller: _latitudeController,
            autofocusState: false,
            placeholder: appLocale.enterLatitude,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]*\.?[0-9]*')),
            ],
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 8),
          _buildTextField(
            controller: _longitudeController,
            autofocusState: false,
            placeholder: appLocale.enterLongitude,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]*\.?[0-9]*')),
            ],
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 8),
          FilledButton.tonal(
            onPressed: _handleCityUpdate,
            child: Text(
              appLocale.change,
              style: AppStyles.mainTextStyleMini,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller,
      required bool autofocusState,
      required String placeholder,
      List<TextInputFormatter>? inputFormatters,
      TextInputAction textInputAction = TextInputAction.done}) {
    final appColors = Theme.of(context).colorScheme;

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
      textInputAction: textInputAction,
      decoration: BoxDecoration(
        borderRadius: AppStyles.mainBorderMini,
        color: appColors.surface,
      ),
      inputFormatters: inputFormatters,
    );
  }

  void _handleCityUpdate() {
    final country = _countryController.text.trim();
    final city = _cityController.text.trim();
    final latitude = _latitudeController.text.trim();
    final longitude = _longitudeController.text.trim();

    if (!_shouldUpdateCity(
        country: country,
        city: city,
        latitude: latitude,
        longitude: longitude)) {
      return;
    }

    final updateCity = {
      DBValueStrings.dbCountry: country,
      DBValueStrings.dbCity: city,
      DBValueStrings.dbLatitude: latitude,
      DBValueStrings.dbLongitude: longitude,
    };

    Navigator.of(context).pop();
    widget.cityState
        .updateCity(mapCity: updateCity, idCity: widget.cityModel.id);
  }

  bool areCoordinatesValid(
      {required String latitude, required String longitude}) {
    final lat = double.tryParse(latitude);
    final lon = double.tryParse(longitude);
    if (lat == null || lon == null) {
      return false;
    }
    return lat >= -90.0 && lat <= 90.0 && lon >= -180.0 && lon <= 180.0;
  }

  bool _shouldUpdateCity({
    required String country,
    required String city,
    required String latitude,
    required String longitude,
  }) {
    return country.isNotEmpty &&
        city.isNotEmpty &&
        areCoordinatesValid(latitude: latitude, longitude: longitude) &&
        (country != widget.cityModel.country ||
            city != widget.cityModel.city ||
            latitude != widget.cityModel.latitude ||
            longitude != widget.cityModel.longitude);
  }
}
