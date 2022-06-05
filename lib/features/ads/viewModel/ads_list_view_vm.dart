import 'package:flutter/material.dart';

import '../view/widgets/ads_card_view_widgets.dart';

class AdsListViewModel extends StatelessWidget {
  const AdsListViewModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return const AdsCardViewWidget();
      },
    );
  }
}
