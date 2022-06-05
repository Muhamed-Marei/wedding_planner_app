import 'package:cloud_firestore/cloud_firestore.dart';

class FoodModel {
  late String imageLink, name, id, cost, uId;

  FoodModel(
      {required this.imageLink,
      required this.name,
      required this.id,
      required this.uId,
      required this.cost,
      });

  factory FoodModel.fromMap(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    return FoodModel(
        imageLink: data['image'] as String,
        name: data['meal_name'] as String,
        id: data['id'] as String,
        uId: data['userId'] as String,
        cost: data['cost_of_meal'] as String,
        );
  }
}
