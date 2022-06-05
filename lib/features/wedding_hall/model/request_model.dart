import '../../../sign_in/sign_in_provider.dart';

class RequestModel {
  late String id,
      numberOfPerson,
      date,
      centerId,
      time,
      note,
      userId,hallCost,totalCost;
  late List sellectedFood;
  late String requestCase;

  RequestModel(
      {required this.id,
      required this.numberOfPerson,
      required this.date,
      required this.sellectedFood,
      required this.centerId,
      required this.time,
      required this.note,
      required this.userId,
      required this.requestCase,
        required this.hallCost,
        required this.totalCost,
      });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'hallId': id,
      'numberOfPerson': numberOfPerson,
      'date': date,
      'selectedFood': sellectedFood,
      "centerId": centerId,
      "time": time,
      "requestCase": requestCase,
      "note": note,
      'totalCost':totalCost,
      'hallCost':hallCost,
    };
  }

  factory RequestModel.fromMap({required Map<String, dynamic> map}) {
    return RequestModel(
      userId: currentUserData.uid,
      time: map["time"] as String,
      id: map['HallId'] as String,
      numberOfPerson: map['numberOfPerson'] as String,
      date: map['date'] as String,
      sellectedFood: map['selectedFood'] as List,
      centerId: map['centerId'] as String,
      note: map["notes"] as String,
      requestCase: map["requestCase"] as String,
      totalCost:map["totalCost"] as String ,
        hallCost:   map["hallCost"] as String,
    );
  }
}
