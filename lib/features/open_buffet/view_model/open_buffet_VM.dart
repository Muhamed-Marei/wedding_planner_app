import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/food_model.dart';
import '../view/widget/open_buffet_food_card.dart';

class OpenBuffetVM extends StatelessWidget {
  OpenBuffetVM({Key? key, required this.uId}) : super(key: key);
  late String uId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Open_Buffet")
              .where("userId", isEqualTo: uId)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                FoodModel foodDataModel = FoodModel.fromMap(document);
                return OpenBuffetCArd(
                  foodData: foodDataModel,
                );
              }).toList(),
            );
          }),
    );
  }
}
