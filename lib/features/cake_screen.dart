import 'package:flutter/material.dart';

import '../gloubale/widgets/sub_app_bar.dart';
import 'home_screen/view/screens/home_screen_view.dart';
import 'home_screen/view/widgets/bottom_navigation_bar.dart';
import 'our_service/view_components/view/widgets/our_service_gridl_view.dart';
import 'our_service/view_components/view/widgets/service_card.dart';
class CakeScreen extends StatelessWidget {
  const CakeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubAppBarWidget(nextScreenWidget: HomeScreen(), title: 'Wedding Cake'),
     body: SingleChildScrollView(
       child:  Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children:  [
           const Text("Wedding Cake",style: TextStyle(color: Colors.cyan,fontSize: 20,fontWeight: FontWeight.bold),),
           Container(
             height: 2000,
             child: GridView.builder(
               gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
               ),
               itemCount: cakeList.length,
               itemBuilder: (BuildContext context, int index) {
                 return GestureDetector(
                   child: ServiceCardView(
                     serviceName: cakeList[index]["serviceName"],
                     imageLink: cakeList[index]["image"],
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

List<Map<String, dynamic>> cakeList = [
  {
    "image": "https://images.pexels.com/photos/1702373/pexels-photo-1702373.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "serviceName": "cake"
  },
  {

    "image": "https://media.istockphoto.com/photos/confectioner-decorating-chocolate-cake-closeup-picture-id1187830875?k=20&m=1187830875&s=612x612&w=0&h=LoRXyD8Jw9N-CfkKtXe23uHctZUetcH5zZFMwIzXapU=",
    "serviceName": "wedding hall"
  },
  {

    "image": "https://images.pexels.com/photos/1702373/pexels-photo-1702373.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "serviceName": "cake"
  },
  {

    "image": "https://media.istockphoto.com/photos/confectioner-decorating-chocolate-cake-closeup-picture-id1187830875?k=20&m=1187830875&s=612x612&w=0&h=LoRXyD8Jw9N-CfkKtXe23uHctZUetcH5zZFMwIzXapU=",
    "serviceName": "wedding hall"
  },
  {

    "image": "https://images.pexels.com/photos/1702373/pexels-photo-1702373.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "serviceName": "cake"
  },
  {

    "image": "https://media.istockphoto.com/photos/confectioner-decorating-chocolate-cake-closeup-picture-id1187830875?k=20&m=1187830875&s=612x612&w=0&h=LoRXyD8Jw9N-CfkKtXe23uHctZUetcH5zZFMwIzXapU=",
    "serviceName": "wedding hall"
  },
  {

    "image": "https://images.pexels.com/photos/1702373/pexels-photo-1702373.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "serviceName": "cake"
  },
  {

    "image": "https://media.istockphoto.com/photos/confectioner-decorating-chocolate-cake-closeup-picture-id1187830875?k=20&m=1187830875&s=612x612&w=0&h=LoRXyD8Jw9N-CfkKtXe23uHctZUetcH5zZFMwIzXapU=",
    "serviceName": "wedding hall"
  },

];
