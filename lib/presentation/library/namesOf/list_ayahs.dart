import 'package:flutter/material.dart';

import '../../../domain/entities/ayah_entity.dart';
import '../../widgets/error_data_text.dart';
import 'ayah_item.dart';

class ListAyahs extends StatelessWidget {
  const ListAyahs({
    super.key,
    required this.fetchAyahsByChapterId,
  });

  final Future<List<AyahEntity>> fetchAyahsByChapterId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AyahEntity>>(
      future: fetchAyahsByChapterId,
      builder: (BuildContext context, AsyncSnapshot<List<AyahEntity>> ayahsSnapshot) {
        if (ayahsSnapshot.hasData) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: ayahsSnapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              final AyahEntity model = ayahsSnapshot.data![index];
              return AyahItem(
                model: model,
                index: index,
              );
            },
          );
        } else if (ayahsSnapshot.hasError) {
          return ErrorDataText(errorText: ayahsSnapshot.error.toString());
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
