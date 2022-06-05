import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wedding_planner_app/sign_in/sign_in_provider.dart';

class RequestViewModel extends StatelessWidget {
  const RequestViewModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return  Center() ;
    },);
  }
}

StateProvider requestProvider = StateProvider((ref) {
  return FirebaseFirestore.instance
      .collection("request")
      .where("userId", isEqualTo: currentUserData.uid)
      .snapshots();
});
