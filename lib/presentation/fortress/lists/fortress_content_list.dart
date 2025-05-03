import 'package:flutter/material.dart';

import '../../../domain/entities/fortress_entity.dart';
import '../../state/fortress_state.dart';
import '../../widgets/app_error_text.dart';
import '../items/fortress_supplication_item.dart';

class FortressContentList extends StatefulWidget {
  const FortressContentList({
    super.key,
    required this.chapterId,
    required this.fortressState,
    required this.tableName,
  });

  final int chapterId;
  final FortressState fortressState;
  final String tableName;

  @override
  State<FortressContentList> createState() => _FortressContentListState();
}

class _FortressContentListState extends State<FortressContentList> {
  late final Future<List<FortressEntity>> _futureContent;

  @override
  void initState() {
    super.initState();
    _futureContent = widget.fortressState.getSupplicationsByChapterId(
      tableName: widget.tableName,
      chapterId: widget.chapterId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FortressEntity>>(
      future: _futureContent,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return AppErrorText(text: snapshot.error.toString());
        }
        if (snapshot.hasData) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final FortressEntity fortressModel = snapshot.data![index];
              return FortressSupplicationItem(
                fortressModel: fortressModel,
                index: index,
                supplicationsCount: snapshot.data!.length,
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
