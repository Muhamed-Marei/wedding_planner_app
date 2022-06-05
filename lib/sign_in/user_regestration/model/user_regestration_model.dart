class UserRegestrationModel {
  late String imageUrl, name, email, phone, uId;

  UserRegestrationModel(
      {required this.imageUrl,
      required this.name,
      required this.email,
      required this.phone,
      required this.uId});

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
    };
  }

  factory UserRegestrationModel.fromMap(Map<String, dynamic> map) {
    return UserRegestrationModel(
      imageUrl: map['imageUrl'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      uId: map['uId'] as String,
    );
  }
}
