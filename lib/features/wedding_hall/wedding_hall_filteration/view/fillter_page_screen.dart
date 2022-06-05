import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../home_screen/view/widgets/bottom_navigation_bar.dart';
import '../../view/screens/wedding_hall_screen.dart';
import '../view_model/wedding_hall_filter_vm.dart';

class HallFilterPage extends StatelessWidget {
  HallFilterPage({Key? key}) : super(key: key);
  TextEditingController cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IntrinsicHeight(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  WeddingHallFilterVM(
                    initValio: cityController,
                  ),
                  Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      return TextButton(
                          onPressed: () {
                            if (cityController.text.length == 0) {
                              ref.watch(selectedCitySearch.state).state =
                                  FirebaseFirestore.instance
                                      .collection("Wedding_Halls");
                            } else {
                              ref.watch(selectedCitySearch.state).state =
                                  FirebaseFirestore.instance
                                      .collection("Wedding_Halls")
                                      .where("city",
                                          isEqualTo: cityController.text);
                            }
                            navigateScreen(nextScreen:WeddingHallScreen());
                          },
                          child: Text("Search"));
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

StateProvider<Query<Map<String, dynamic>>> selectedCitySearch =
    StateProvider<Query<Map<String, dynamic>>>(
        (ref) => FirebaseFirestore.instance.collection("Wedding_Halls"));
