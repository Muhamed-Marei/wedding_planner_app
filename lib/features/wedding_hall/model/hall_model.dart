import 'package:cloud_firestore/cloud_firestore.dart';

class HallModel {
  late String hallName,
      address,
      city,
      hallId,
      centerId,
      details,
      phone,
      openBuffet;
  int   maxPerson,
      minPerson ;
  double costPerPerson ;

  late List<dynamic> imageList;

  HallModel({
    required this.hallName,
    required this.address,
    required this.city,
    required this.hallId,
    required this.centerId,
    required this.details,
    required this.phone,
    required this.openBuffet,
    required this.maxPerson,
    required this.minPerson,
    required this.costPerPerson,
    required this.imageList,
  });

  factory HallModel.fromMap(DocumentSnapshot doc) {
    dynamic map = doc.data();
    return HallModel(
      costPerPerson: double.parse( map['Cost_per_person'] as String),
      maxPerson:int.parse( map['min_person'] as String),
      minPerson:int.parse( map['max_person'] as String),
      address: map['address'] as String,
      hallName: map['Hall_name'] as String,
      city: map['city'] as String,
      hallId: map['id'] as String,
      centerId: map['userId'] as String,
      details: map['titleCenter'] as String,
      phone: map['Hall_phone'] as String,
      openBuffet: map['open_buffet'] as String,
      imageList: map['image'] as List<dynamic>,
    );
  }
}
