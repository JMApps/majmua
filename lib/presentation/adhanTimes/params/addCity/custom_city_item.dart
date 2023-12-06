import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/domain/entities/custom_city_entity.dart';

class CustomCityItem extends StatelessWidget {
  const CustomCityItem({
    super.key,
    required this.cityModel,
    required this.index,
  });

  final CustomCityEntity cityModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color itemOddColor = appColors.primaryColor.withOpacity(0.05);
    final Color itemEvenColor = appColors.primaryColor.withOpacity(0.15);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        onTap: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: appColors.surface,
            builder: (context) => Container(
              padding: AppStyles.mardingHorizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FilledButton.tonal(
                    onPressed: () {
                      // TODO Set city params
                      Navigator.pop(context);
                    },
                    child: Text(
                      appLocale!.select,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  FilledButton.tonal(
                    onPressed: () {
                      // TODO Set city params
                      Navigator.pop(context);
                    },
                    child: Text(
                      appLocale.change,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  FilledButton.tonal(
                    onPressed: () {
                      // TODO Set city params
                      Navigator.pop(context);
                    },
                    child: Text(
                      appLocale.delete,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
        tileColor: index.isOdd ? itemOddColor : itemEvenColor,
        visualDensity: const VisualDensity(vertical: -4),
        title: Text(
          cityModel.city,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          cityModel.country,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        leading: CircleAvatar(
          backgroundColor: appColors.quaternaryColor,
          child: Text(
            '${index + 1}',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
