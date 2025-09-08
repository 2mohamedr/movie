class UserModel {
  final String email;
  final String name;
  final String phone;
  final String avatarId;
  String? token;

  UserModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.avatarId,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    final dataMap = map['data'] ?? map;
    return UserModel(
      email: dataMap['email'],
      name: dataMap['name'],
      phone: dataMap['phone'],
      avatarId: dataMap['avaterId'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "name": name,
      "phone": phone,
      "avatarId": avatarId,
      "token": token,
    };
  }
}

/*
{
    "message": "Profile fetched successfully",
    "data": {
        "_id": "68ba36d1f0d6fe29d6ffc8a7",
        "email": "9iro@bk.ru",
        "password": "$2b$10$RtNKeXLTyEqceidI7/ul2uW5WDBznEjCQBA0eIdilf9G4J5nVwqq.",
        "name": "Ibram Nagy",
        "phone": "+201129870882",
        "avaterId": 1,
        "createdAt": "2025-09-05T01:03:13.807Z",
        "updatedAt": "2025-09-05T01:03:13.807Z",
        "__v": 0
    }
}
 */
