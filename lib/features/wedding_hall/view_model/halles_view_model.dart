import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view/widgets/fav_hall_card_home_view.dart';
import '../model/hall_model.dart';
import '../view/widgets/wedding_card.dart';
import '../wedding_hall_filteration/view/fillter_page_screen.dart';

class HallsViewModel extends StatelessWidget {
  const HallsViewModel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return   StreamBuilder<QuerySnapshot>(
        stream:  ref.watch(selectedCitySearch.state).state.snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {return const Text('Something went wrong');}
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return
            Column(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                return HallCard(hallModelDAta: HallModel.fromMap(document));
              }).toList(),
            );
        },
      ) ;
    },
    );
  }
}

