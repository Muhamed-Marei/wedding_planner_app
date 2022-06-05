import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view/widgets/fav_hall_card_home_view.dart';

class FavoriteHallsViewModel extends StatelessWidget {
  const FavoriteHallsViewModel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return StreamBuilder<QuerySnapshot>(
          stream:  FirebaseFirestore.instance.collection("Wedding_Halls").snapshots(),
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
              scrollDirection: Axis.horizontal,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                dynamic map = document.data() ;
                return FavCardViewWidget(image: map["image"][0],);
              }).toList(),
            );
          },
        );
      },
    );
  }
}