import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/strings/app_constraints.dart';
import 'package:majmua/data/repositories/gems_data_repository.dart';
import 'package:majmua/domain/entities/gem_entity.dart';
import 'package:majmua/domain/usecases/gems_use_case.dart';
import 'package:majmua/presentation/gems/gem_item.dart';
import 'package:majmua/presentation/state/gems_settings_state.dart';
import 'package:majmua/presentation/widgets/error_data_text.dart';
import 'package:majmua/presentation/widgets/user_back_button.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class GemsList extends StatefulWidget {
  const GemsList({
    super.key,
    required this.bucketStorage,
  });

  final PageStorageBucket bucketStorage;

  @override
  State<GemsList> createState() => _GemsListState();
}

class _GemsListState extends State<GemsList> {
  final ItemScrollController _itemScrollController = ItemScrollController();
  final GemsUseCase _gemsUseCase = GemsUseCase(GemsDataRepository());

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const UserBackButton(),
        title: Text(appLocale!.gemsTarifi),
        actions: [
          IconButton(
            onPressed: () {
              _itemScrollController.scrollTo(
                index: Provider.of<GemsSettingsState>(context, listen: false).getRandomNumber,
                duration: const Duration(milliseconds: 750),
              );
            },
            splashRadius: 20,
            icon: Image.asset(
              'assets/icons/refresh.png',
              width: 20,
              height: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<GemEntity>>(
        future: _gemsUseCase.fetchAllGems(),
        builder: (BuildContext context, AsyncSnapshot<List<GemEntity>> snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return PageStorage(
              bucket: widget.bucketStorage,
              child: ScrollablePositionedList.builder(
                itemScrollController: _itemScrollController,
                key: const PageStorageKey<String>(AppConstraints.keyBucketFortressListChapters),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final GemEntity model = snapshot.data![index];
                  return GemItem(
                    model: model,
                    itemIndex: index,
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
