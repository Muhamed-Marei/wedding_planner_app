import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/cars_model.dart';
import '../view/widgets/car_card.dart';


class CarViewModel extends StatelessWidget {
  const CarViewModel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return StreamBuilder<QuerySnapshot>(
          stream:  FirebaseFirestore.instance.collection("Wedding_Car").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                final  documentData = document.data() ;
                return CarCard(carModelDAta: CarsModel.fromMap(documentData));
              }).toList(),
            );
          },
        );
      },
    );
  }
}
