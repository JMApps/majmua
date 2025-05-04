import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../domain/entities/fortress_entity.dart';
import '../../state/fortress_state.dart';
import '../../widgets/app_error_text.dart';
import '../items/fortress_supplication_item.dart';

class FortressContentPages extends StatefulWidget {
  const FortressContentPages({
    super.key,
    required this.chapterId,
    required this.fortressState,
    required this.tableName,
  });

  final int chapterId;
  final FortressState fortressState;
  final String tableName;

  @override
  State<FortressContentPages> createState() => _FortressContentPagesState();
}

class _FortressContentPagesState extends State<FortressContentPages> {
  late final Future<List<FortressEntity>> _futureContent;
  final PageController _pageController = PageController();

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
    final appColors = Theme.of(context).colorScheme;
    return FutureBuilder<List<FortressEntity>>(
      future: _futureContent,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return AppErrorText(text: snapshot.error.toString());
        }
        if (snapshot.hasData) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final FortressEntity fortressModel = snapshot.data![index];
                    return FortressSupplicationItem(
                      fortressModel: fortressModel,
                      index: index,
                      supplicationsCount: snapshot.data!.length,
                    );
                  },
                ),
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: snapshot.data!.length,
                effect: ScrollingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 16,
                  dotColor: appColors.secondaryContainer,
                  activeDotColor: appColors.primary,
                ),
              ),
              const SizedBox(height: 16),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
