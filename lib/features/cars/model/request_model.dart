

class CarRequestModel{
  late String date , time , note, carId , centerId , clientID ,orderType  ;
  late String caseRequest ;

  CarRequestModel({required this.date, required this.time, required this.note, required this.carId, required this.centerId,
    required this.clientID , required this.caseRequest });

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'time':time,
      'note': note,
      'carId': carId,
      'centerId': centerId,
      'case': caseRequest ,
      'clientID': clientID,
    };
  }
  factory CarRequestModel.fromMap(Map<String, dynamic> map) {
    return CarRequestModel(
      caseRequest:map['caseRequest'] as String,
      date: map['date'] as String,
      time: map['time'] as String,
      note: map['note'] as String,
      carId: map['carId'] as String,
      centerId: map['centerId'] as String,
      clientID: map['clientID'] as String,
    );
  }
}