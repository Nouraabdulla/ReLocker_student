class UserModel {
  String? userId;
  String? email;
  String? userName;
  String? phone;
  String? reservedlocker;

  UserModel({
    required this.userId,
    required this.email,
    required this.userName,
    this.phone,
    required this.reservedlocker,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    email = json['email'];
    userName = json['user_name'];
    phone = json['phone'] ?? 'unknown';
    reservedlocker = "";
  }

  toJson() {
    return {
      "user_id": userId,
      "email": email,
      "user_name": userName,
      "phone": phone ?? 'unknown',
      "reservedlocker": reservedlocker,
    };
  }
}
