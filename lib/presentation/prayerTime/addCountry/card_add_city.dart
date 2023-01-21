import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:majmua/application/state/prayer_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
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
                    Map<String, String> newCity = {
                      'country': _countryController.text,
                      'city': _cityController.text,
                      'latitude': _latitudeController.text,
                      'longitude': _longitudeController.text,
                    };
                    prayerTimeState.createCity = newCity;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(milliseconds: 2250),
                        backgroundColor: appColors.firstAppColor,
                        content: const Text(
                          AppString.added,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Nexa',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  }
                },
                color: appColors.thirdAppColor,
                shape: AppWidgetStyle.mainRectangleBorderMini,
                child: const Text(
                  AppString.add,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
