import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/data/repositories/fortress_data_repository.dart';
import 'package:majmua/domain/entities/supplication_fortress_entity.dart';
import 'package:majmua/domain/usecases/fortress_use_case.dart';
import 'package:majmua/presentation/fortress/supplication_item.dart';
import 'package:majmua/presentation/widgets/error_data_text.dart';

class FortressContentPage extends StatefulWidget {
  const FortressContentPage({
    super.key,
    required this.chapterTitle,
    required this.chapterId,
  });

  final String chapterTitle;
  final int chapterId;

  @override
  State<FortressContentPage> createState() => _FortressContentPageState();
}

class _FortressContentPageState extends State<FortressContentPage> {
  late final FortressUseCase _fortressUseCase;

  @override
  void initState() {
    super.initState();
    _fortressUseCase = FortressUseCase(FortressDataRepository());
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chapterTitle),
        actions: [
          IconButton(
            onPressed: () {},
            splashRadius: 20,
            icon: const Icon(
              CupertinoIcons.settings,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<SupplicationFortressEntity>>(
        future: _fortressUseCase.fetchSupplicationByChapterId(
          tableName: appLocale!.tableOfSupplications,
          chapterId: widget.chapterId,
        ),
        builder: (BuildContext context,
            AsyncSnapshot<List<SupplicationFortressEntity>> snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return CupertinoScrollbar(
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final SupplicationFortressEntity model =
                      snapshot.data![index];
                  return SupplicationItem(
                    model: model,
                    itemIndex: index,
                    itemsLength: snapshot.data!.length,
                  );
                },
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
