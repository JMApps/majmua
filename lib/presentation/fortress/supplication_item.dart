import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/data/database/local/model/supplication_model.dart';

class SupplicationItem extends StatelessWidget {
  const SupplicationItem({Key? key, required this.item}) : super(key: key);

  final SupplicationModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: AppStyles.mainMarginMini,
      shape: AppStyles.mainCardBorderRadius,
      child: Center(
        child: SingleChildScrollView(
          padding: AppStyles.mainPadding,
          child: Column(
            children: [
              Text(item.contentArabic!),
              const SizedBox(height: 16),
              Text(item.contentTranscription!),
              const SizedBox(height: 16),
              Text(item.contentTranslation),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {},
                child: const CircleAvatar(
                  radius: 35,
                  child: Text(
                    '42',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
