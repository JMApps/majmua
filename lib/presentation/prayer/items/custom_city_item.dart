import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/city_entity.dart';
import '../../state/city_state.dart';
import '../widgets/select_custom_city_bottom_sheet.dart';

class CustomCityItem extends StatelessWidget {
  const CustomCityItem({
    super.key,
    required this.cityModel,
    required this.index,
  });

  final CityEntity cityModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final Color itemOdd = appColors.primary.withAlpha(20);
    final Color itemEven = appColors.primary.withAlpha(05);
    return Card(
      margin: AppStyles.mardingBottomMini,
      elevation: 0,
      color: index.isOdd ? itemOdd : itemEven,
      child: Consumer<CityState>(
        builder: (context, cityState, _) {
          return ListTile(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => SelectCustomCityBottomSheet(
                  cityModel: cityModel,
                  cityState: cityState,
                ),
              );
            },
            visualDensity: VisualDensity.compact,
            contentPadding: AppStyles.mardingHorizontalMini,
            shape: AppStyles.mainShapeMini,
            splashColor: appColors.primary.withAlpha(50),
            title: Text(
              cityModel.city,
              style: AppStyles.mainTextStyleMiniBold,
            ),
            subtitle: Text(
              cityModel.country,
              style: AppStyles.mainTextStyleMini,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: appColors.secondary,
            ),
          );
        },
      ),
    );
  }
}
