import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/core/strings/app_constraints.dart';
import 'package:majmua/domain/entities/supplication_fortress_entity.dart';
import 'package:majmua/presentation/fortress/supplication_item.dart';
import 'package:majmua/presentation/widgets/error_data_text.dart';

class FortressList extends StatelessWidget {
  const FortressList({
    super.key,
    required this.chapterId,
    required this.chapterTitle,
    required this.supplicationsByChapterId,
    required this.bucketStorage,
  });

  final int chapterId;
  final String chapterTitle;
  final Future<List<SupplicationFortressEntity>> supplicationsByChapterId;
  final PageStorageBucket bucketStorage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chapterTitle),
      ),
      body: FutureBuilder<List<SupplicationFortressEntity>>(
        future: supplicationsByChapterId,
        builder: (BuildContext context, AsyncSnapshot<List<SupplicationFortressEntity>> snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return PageStorage(
              bucket: bucketStorage,
              child: CupertinoScrollbar(
                child: ListView.builder(
                  key: const PageStorageKey<String>(AppConstraints.keyBucketListChapters),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final SupplicationFortressEntity model = snapshot.data![index];
                    return SupplicationItem(
                      model: model,
                      itemIndex: index,
                      itemsLength: snapshot.data!.length,
                    );
                  },
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return ErrorDataText(errorText: snapshot.error.toString());
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}