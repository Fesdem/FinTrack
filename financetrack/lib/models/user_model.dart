class UserModel {
  String id;
  String email;
  String firName;
  String lasName;
  String userName;
  String deviceToken;

  UserModel({
    required this.id,
    required this.email,
    required this.firName,
    required this.lasName,
    required this.userName,
    required this.deviceToken,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'firName': firName,
      'lasName': lasName,
      'userName': userName,
      'deviceToken': deviceToken,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      firName: map['firName'],
      lasName: map['lasName'],
      userName: map['userName'],
      deviceToken: map['deviceToken'],
    );
  }
}
