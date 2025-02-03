import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppNotificationsPage extends StatelessWidget {
  const AppNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale.notifications),
      ),
      body: Container(),
    );
  }
}
