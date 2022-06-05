import 'package:flutter/material.dart';

import '../../../home_screen/view/widgets/bottom_navigation_bar.dart';
import '../../model/hall_model.dart';
import '../screens/wedding_hall_profile_screen.dart';

class HallCard extends StatelessWidget {
  HallModel hallModelDAta;
  HallCard({Key? key, required this.hallModelDAta}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: 150,
        child: GestureDetector(
          onTap: () {

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return    HallProfileScreen(
                hallData: hallModelDAta,
              );
            }));

          },
          child: Card(
            color: Colors.white,
            clipBehavior: Clip.antiAlias,
            shadowColor: Colors.cyanAccent,
            elevation: 10,
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Image.network(hallModelDAta.imageList[0],fit: BoxFit.fill,)),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            hallModelDAta.hallName,
                            maxLines: 2,
                            textDirection: TextDirection.rtl,
                          ),
                          subtitle: Text(
                            hallModelDAta.details,
                            maxLines: 2,
                          ),
                        ),
                        Text(
                          hallModelDAta.address,
                          maxLines: 2,
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class HallImageWidget extends StatelessWidget {
//   late HallModel hallModelData;
//   HallImageWidget({Key? key, required this.hallModelData}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         showModalBottomSheet(
//           context: context,
//           builder: (BuildContext context) {
//             return HallMoreDetiles(
//               hallModelData: hallModelData,
//             );
//           },
//         );
//       },
//       child: Image.network(
//         hallModelData.imageList[1],
//         fit: BoxFit.fill,
//       ),
//     );
//   }
// }
//
// class HallMoreDetiles extends StatelessWidget {
//   late HallModel hallModelData;
//   HallMoreDetiles({Key? key, required this.hallModelData}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: EdgeInsetsDirectional.only(top: 4, start: 4, end: 4),
//       children: [
//         SizedBox(
//           height: 200,
//           child: PageView.builder(
//             itemCount: hallModelData.imageList.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Image.network(
//                 hallModelData.imageList[index],
//                 fit: BoxFit.fill,
//               );
//             },
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(4.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text("food served"),
//               Column(
//                 children: [
//                   hallModelData.openBuffet == "true"
//                       ? Padding(
//                           padding: const EdgeInsets.all(4.0),
//                           child: Container(
//                               decoration: const BoxDecoration(
//                                   borderRadius: BorderRadius.horizontal(
//                                       left: Radius.circular(20),
//                                       right: Radius.circular(20)),
//                                   color: Colors.cyanAccent),
//                               child: const Text("open buffet")),
//                         )
//                       : Container(),
//                   hallModelData.openBuffet == "true"
//                       ? Padding(
//                           padding: const EdgeInsets.all(4.0),
//                           child: Container(
//                               decoration: const BoxDecoration(
//                                   borderRadius: BorderRadius.horizontal(
//                                       left: Radius.circular(20),
//                                       right: Radius.circular(20)),
//                                   color: Colors.cyanAccent),
//                               child: const Text("open buffet")),
//                         )
//                       : Container(),
//                 ],
//               )
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               Expanded(child: Text("phone : ${hallModelData.phone}")),
//             ],
//           ),
//         ),
//         ListTile(
//           title: Text(hallModelData.city),
//           subtitle: Text(hallModelData.address),
//         ),
//         ListTile(
//           title: Text(hallModelData.hallName),
//           subtitle: Text(hallModelData.details),
//         ),
//         Center(
//             child: TextButton(
//                 onPressed: () {
//                   navigateScreen(
//                       nextScreen: HallProfileScreen(
//                     hallData: hallModelData,
//                   ));
//                 },
//                 child: const Text("View Profile")))
//       ],
//     );
//   }
// }
