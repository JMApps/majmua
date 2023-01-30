import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:majmua/application/state/prayer_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/data/database/models/custom_country_model.dart';
import 'package:provider/provider.dart';

class CardChangeCity extends StatefulWidget {
  const CardChangeCity({
    Key? key,
    required this.item,
  }) : super(key: key);

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
    return Card(
      color: appColors.mainReverse,
      margin: AppWidgetStyle.mainMargin,
      child: SingleChildScrollView(
        padding: AppWidgetStyle.mainMargin,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                decoration: const InputDecoration(
                  labelText: AppString.countryName,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppString.enterCountryName;
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 8),
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
                decoration: const InputDecoration(
                  labelText: AppString.cityName,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppString.enterCityName;
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 8),
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
                decoration: const InputDecoration(
                  labelText: AppString.latitude,
                ),
                validator: (value) {
                  if (value!.isEmpty && !RegExp(r'^[0-9.]+').hasMatch(value)) {
                    return AppString.enterLatitude;
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 8),
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
                decoration: const InputDecoration(
                  labelText: AppString.longitude,
                ),
                validator: (value) {
                  if (value!.isEmpty && !RegExp(r'^[0-9.]+').hasMatch(value)) {
                    return AppString.enterLongitude;
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              AppString.addCountryCoordinatesInformation,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Consumer<PrayerTimeState>(
              builder: (BuildContext context, prayerTimeState, _) {
                return MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (_formCountryKey.currentState!.validate() &&
                        _formCityKey.currentState!.validate() &&
                        _formLatitudeKey.currentState!.validate() &&
                        _formLongitudeKey.currentState!.validate()) {
                      if (widget.item.country != _countryController.text ||
                          widget.item.city != _cityController.text ||
                          widget.item.latitude != _latitudeController.text ||
                          widget.item.longitude != _longitudeController.text) {
                        Map<String, String> updateCity = {
                          'country': _countryController.text,
                          'city': _cityController.text,
                          'latitude': _latitudeController.text,
                          'longitude': _longitudeController.text,
                        };
                        prayerTimeState.updateCity(updateCity, widget.item.id);
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(milliseconds: 2250),
                          backgroundColor: appColors.firstAppColor,
                          content: const Text(
                            AppString.changed,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Nexa',
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  color: appColors.thirdAppColor,
                  shape: AppWidgetStyle.mainRectangleBorderMini,
                  child: const Text(
                    AppString.change,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
