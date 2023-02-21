import 'package:flutter/material.dart';
import 'package:majmua/data/database/queries/names_of_query.dart';
import 'package:majmua/presentation/library/namesOf/ayahs_card_item.dart';

class AyahsContainer extends StatefulWidget {
  const AyahsContainer({Key? key, required this.clarificationIndex})
      : super(key: key);

  final int clarificationIndex;

  @override
  State<AyahsContainer> createState() => _AyahsContainerState();
}

class _AyahsContainerState extends State<AyahsContainer> {
  final NamesOfQuery _namesOfQuery = NamesOfQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _namesOfQuery.getContentAyahs(widget.clarificationIndex + 1),
      builder: (BuildContext context, snapshot) {
        return snapshot.hasData
            ? Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AyahsCardItem(
                        item: snapshot.data![index],
                      );
                    },
                  ),
                ],
              )
            : const SizedBox();
      },
    );
  }
}
