import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';

class IstikharaPage extends StatelessWidget {
  const IstikharaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              appLocale!.appName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            elevation: 0,
            centerTitle: true,
          ),
          SliverToBoxAdapter(
            child: Card(
              margin: AppStyles.mainMardingMini,
              color: appColors.glass,
              child: const Padding(
                padding: AppStyles.mainMardingMini,
                child: Center(
                  child: Text('YES'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
