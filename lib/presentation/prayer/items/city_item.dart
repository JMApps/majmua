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
    final Color itemOdd = appColors.primary.withAlpha(20);
    final Color itemEven = appColors.primary.withAlpha(05);
    return Card(
      margin: AppStyles.mardingBottomMini,
      elevation: 0,
      color: index.isOdd ? itemOdd : itemEven,
      child: ListTile(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SelectCityBottomSheet(
              cityModel: cityModel,
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
        leading: CircleAvatar(
          backgroundColor: appColors.secondaryContainer,
          child: Padding(
            padding: AppStyles.mardingTopMicroMini,
            child: Text(
              cityModel.iso3!,
              style: TextStyle(
                fontSize: 13.0,
                color: appColors.secondary,
              ),
            ),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: appColors.secondary,
        ),
      ),
    );
  }
}
