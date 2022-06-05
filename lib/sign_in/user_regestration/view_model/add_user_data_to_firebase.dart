


import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_regestration_model.dart';

addUserData({required UserRegestrationModel userModel}){
  CollectionReference userCollection = FirebaseFirestore.instance.collection("usersData");
  userCollection.doc(userModel.uId).set(userModel.toMap());
}