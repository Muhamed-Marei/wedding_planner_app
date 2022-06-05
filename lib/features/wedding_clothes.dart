import 'package:flutter/material.dart';

import '../gloubale/widgets/sub_app_bar.dart';
import 'home_screen/view/screens/home_screen_view.dart';
import 'home_screen/view/widgets/bottom_navigation_bar.dart';
import 'our_service/view_components/view/widgets/our_service_gridl_view.dart';
import 'our_service/view_components/view/widgets/service_card.dart';
class ClothesScreen extends StatelessWidget {
  const ClothesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubAppBarWidget(nextScreenWidget: HomeScreen(), title: 'Wedding Clothes'),
      body: SingleChildScrollView(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            const Text("Wedding Clothes",style: TextStyle(color: Colors.cyan,fontSize: 20,fontWeight: FontWeight.bold),),
            Container(
              height: 2000,
              child: GridView.builder(
                gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                ),
                itemCount: clothesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height:  50,
                    child: GestureDetector(
                      child: ClothesCardView(
                        serviceName: clothesList[index]["serviceName"],
                        imageLink: clothesList[index]["image"],
                      ),
                    ),
                  );
                },
              ),
            ) ,

          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> clothesList = [
  {
    "image": "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F20%2F2021%2F02%2F11%2Fdisney-wedding-dress-tout.jpg&q=60","serviceName": "wedding dress"
  },
  {

    "image": "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F20%2F2021%2F02%2F11%2Fdisney-wedding-dress-tout.jpg&q=60"
    ,"serviceName": "dress"
  },
  {

    "image": "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F20%2F2021%2F02%2F11%2Fdisney-wedding-dress-tout.jpg&q=60"
    ,"serviceName": "dress"
  },
];

class ClothesCardView extends StatelessWidget {
  late  String _imageLink ;
  late String _serviceName ;
  ClothesCardView({Key? key,required String imageLink ,required String serviceName}) : super(key: key){
    _imageLink =imageLink;
    _serviceName = serviceName;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Card(
        elevation: 5,

          child: Row(
            // fit: StackFit.expand,
            children: [
              Image.network(
                height: 100,
                _imageLink,
                fit: BoxFit.fill,
              ),
              Container(
                  child:  Text(
                    _serviceName,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ))
            ],
          ),

      ),
    );
  }
}
