import 'package:flutter/material.dart';
import '../../../../Style/font_style/fonts_style.dart';
import '../../../../gloubale/widgets/sub_app_bar.dart';
import '../../../ads/view/widgets/ads_list_view.dart';
import '../widgets/favorite_hall_home_list_view.dart';
import '../../../home_screen/view/screens/home_screen_view.dart';
import '../../view_model/halles_view_model.dart';
class WeddingHallScreen extends StatelessWidget {
  const WeddingHallScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubAppBarWidget(
          nextScreenWidget: const HomeScreen(), title: 'hall page'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children:  [
            const AdsListView(),
            const FavHallListHomePageView(),
            SizedBox(height: 8,),
            HomePageTitleStyle(
              title: "افضل العروض فى مدينتك",
            ),
            const HallsViewModel()
          ],
        ),
      ),
    );
  }
}
