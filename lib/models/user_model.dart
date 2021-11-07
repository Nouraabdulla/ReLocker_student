class UserModel{
  String? userId;
  String? email;
  String? userName;
  String? phone;

  UserModel({
    required this.userId,
    required this.email,
    required this.userName,
    this.phone,
  });

  UserModel.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
    email = json['email'];
    userName = json['user_name'];
    phone = json['phone']??'unknown';
  }

  toJson(){
    return {
      "user_id": userId,
      "email": email,
      "user_name": userName,
      "phone": phone??'unknown'
    };
  }
}