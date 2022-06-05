import 'package:flutter/material.dart';

import '../../../../Style/font_style/fonts_style.dart';
import '../../../ads/view/widgets/ads_card_view_widgets.dart';
import '../../../home_screen/view/screens/home_screen_view.dart';
import '../../view_model/favorite_halls_view_model.dart';
import '../../view_model/halles_view_model.dart';
import 'fav_hall_card_home_view.dart';

class FavHallListHomePageView extends StatelessWidget {
  const FavHallListHomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:30 ),
      child: Container(
        height: 150,
        child: ListTile(
          title:HomePageTitleStyle(title:  'القاعات المرشحه',),
          subtitle: const FavoriteHallsViewModel(),
        ),
      ),
    );
  }
}