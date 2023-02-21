import 'package:flutter/material.dart';
import 'package:majmua/data/database/queries/names_of_query.dart';
import 'package:majmua/presentation/library/namesOf/names_card_item.dart';

class NamesContainer extends StatefulWidget {
  const NamesContainer({Key? key, required this.clarificationIndex})
      : super(key: key);

  final int clarificationIndex;

  @override
  State<NamesContainer> createState() => _NamesContainerState();
}

class _NamesContainerState extends State<NamesContainer> {
  final NamesOfQuery _namesOfQuery = NamesOfQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _namesOfQuery.getContentNames(widget.clarificationIndex + 1),
      builder: (BuildContext context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return NamesCardItem(
                    item: snapshot.data![index],
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator.adaptive(),
              );
      },
    );
  }
}
