import 'package:flutter/material.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/city_entity.dart';
import '../widgets/select_city_bottom_sheet.dart';

class CityItem extends StatelessWidget {
  const CityItem({
    super.key,
    required this.cityModel,
    required this.index,
  });

  final CityEntity cityModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final Color itemOdd = appColors.primary.withAlpha(15);
    final Color itemEven = appColors.primary.withAlpha(5);
    return Card(
      color: index.isOdd ? itemOdd : itemEven,
      margin: AppStyles.mardingBottomMini,
      child: ListTile(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SelectCityBottomSheet(cityModel: cityModel),
          );
        },
        shape: AppStyles.mainShapeMini,
        splashColor: appColors.primary.withAlpha(50),
        title: Text(
          cityModel.city,
          style: AppStyles.mainTextStyleBig,
        ),
        subtitle: Text(
          cityModel.country,
          style: AppStyles.mainTextStyle,
        ),
        leading: CircleAvatar(
          backgroundColor: appColors.tertiaryContainer,
          child: Padding(
            padding: AppStyles.mardingTopMicroMini,
            child: Text(
              cityModel.iso3,
              style: AppStyles.mainTextStyleMini,
            ),
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
