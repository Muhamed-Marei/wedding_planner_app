class CarsModel {
 late String model , cost , address ,cardId ,phoneNumber ,
   userId ;
late List<dynamic> image  ;
 CarsModel({required this.model, required this.cost, required this.address, required this.cardId, required this.image,
   required this.phoneNumber,  required this.userId});

 Map<String, dynamic> toMap() {
    return {
      'model': model,
      'cost': cost,
      'address': address,
      'cardId': cardId,
      'image': image,
      'phoneNumber': phoneNumber,
      'userId': userId,
    };
  }

  factory CarsModel.fromMap( dynamic  map) {
    return CarsModel(
      model: map['CarModel'] as String,
      cost: map['Cost'] as String,
      address: map['address'] as String,
      cardId: map['carId'] as String,
      image: map['image'] as List<dynamic>,
      phoneNumber: map['phoneNumber'] as String,
      userId: map['userId'] as String,
    );
  }
}