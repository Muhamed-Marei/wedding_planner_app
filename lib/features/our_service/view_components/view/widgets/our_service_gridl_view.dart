import 'package:flutter/material.dart';
import 'package:wedding_planner_app/features/our_service/view_components/view/widgets/service_card.dart';
import 'package:wedding_planner_app/features/wedding_hall/wedding_hall_filteration/view/fillter_page_screen.dart';
import '../../../../../Style/font_style/fonts_style.dart';

import '../../../../cake_screen.dart';
import '../../../../cars/view/screens/cars_screen.dart';
import '../../../../home_screen/view/widgets/bottom_navigation_bar.dart';

import '../../../../wedding_clothes.dart';
import '../../../../wedding_hall/view/screens/wedding_hall_screen.dart';

class OurServiceGridlView extends StatelessWidget {
  const OurServiceGridlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: HomePageTitleStyle(
          title: "ابدا فى تنظيم حفلتك",
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: GridView.builder(
          gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: serviceList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                navigateScreen(nextScreen: serviceList[index]["screen"] );
              },
              child: ServiceCardView(
                serviceName: serviceList[index]["serviceName"],
                imageLink: serviceList[index]["image"],
              ),
            );
          },
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> serviceList = [
  {
    "screen" : WeddingHallScreen() ,
    "image": "https://img.icons8.com/doodle/480/000000/wedding-gift--v1.png",
    "serviceName": "packages"
  },
  {
    "screen" :HallFilterPage() ,
    "image": "https://img.icons8.com/external-xnimrodx-lineal-color-xnimrodx/512/000000/external-hall-wedding-xnimrodx-lineal-color-xnimrodx.png",
    "serviceName": "wedding hall"
  },
  {
    "screen" : CarScreen() ,
    "image": "https://img.icons8.com/external-filled-outline-02-chattapat-/512/000000/external-wedding-wedding-filled-outline-02-chattapat--12.png",
    "serviceName": "wedding cars"
  },
  {
    "screen" : WeddingHallScreen() ,
    "image": "https://img.icons8.com/external-filled-outline-02-chattapat-/512/000000/external-wedding-wedding-filled-outline-02-chattapat--11.png",
    "serviceName": "wedding card"
  },

  {
    "screen" : ClothesScreen() ,
    "image": "https://img.icons8.com/external-flat-02-chattapat-/512/000000/external-wedding-wedding-flat-02-chattapat--4.png",
    "serviceName": "wedding clothes"
  },
  {
    "screen" : CakeScreen() ,
    "image": "https://img.icons8.com/external-filled-outline-02-chattapat-/512/000000/external-wedding-wedding-filled-outline-02-chattapat--9.png",
    "serviceName": "wedding cake"
  },
];
