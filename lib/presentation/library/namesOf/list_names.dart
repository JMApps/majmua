import 'package:flutter/material.dart';

import '../../../domain/entities/name_entity.dart';
import '../../widgets/error_data_text.dart';
import 'name_item.dart';

class ListNames extends StatelessWidget {
  const ListNames({
    super.key,
    required this.fetchNamesByChapterId,
  });

  final Future<List<NameEntity>> fetchNamesByChapterId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NameEntity>>(
      future: fetchNamesByChapterId,
      builder: (BuildContext context, AsyncSnapshot<List<NameEntity>> namesSnapshot) {
        if (namesSnapshot.hasData) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: namesSnapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              final NameEntity model = namesSnapshot.data![index];
              return NameItem(
                model: model,
                index: index,
              );
            },
          );
        } else if (namesSnapshot.hasError) {
          return ErrorDataText(errorText: namesSnapshot.error.toString());
        } else {
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
