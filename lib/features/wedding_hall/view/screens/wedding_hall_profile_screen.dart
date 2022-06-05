import 'package:flutter/material.dart';
import 'package:wedding_planner_app/features/wedding_hall/view/screens/wedding_hall_screen.dart';

import '../../../../gloubale/widgets/sub_app_bar.dart';
import '../../../open_buffet/view/screen/open_buffet_screen.dart';
import '../../model/hall_model.dart';
import '../../wedding_hall_filteration/view_model/wedding_hall_filter_vm.dart';
import '../forms/hallrequest_form_view.dart';

class HallProfileScreen extends StatelessWidget {
  HallModel hallData;
  HallProfileScreen({Key? key, required this.hallData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
         title: Text("hall profile")),
      body: ListView(
        padding: EdgeInsetsDirectional.only(top: 4, start: 4, end: 4),
        children: [
          SizedBox(
            height: 200,
            child: PageView.builder(
              itemCount: hallData.imageList.length,
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  hallData.imageList[index],
                  fit: BoxFit.fill,
                );
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            if(  hallData.openBuffet == "true")
              Text("has open buffet"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: Text("phone : ${hallData.phone}")),
              ],
            ),
          ),
          ListTile(
            title: Text(hallData.city),
            subtitle: Text(hallData.address),
          ),
          ListTile(
            title: Text(hallData.hallName),
            subtitle: Text(hallData.details),
          ),
          Center(
           child:   TextButton(onPressed: () {
             showDialog<String>(
                 context: context,
                 builder: (BuildContext context) =>  RequestAlertFormView(hallData: hallData,));
           }, child: const Text("Book now"))
          )
        ],
      ),
    );
  }
}
