class UserRequestModel{
  String name;
  String username;
  String email;
  String password;
  String phonenumber;
  String address;

  UserRequestModel({required this.name, required this.username,required this.email, required this.password,
    required this.phonenumber, required this.address});

  factory UserRequestModel.fromJson(Map<String, dynamic> json) {
    return UserRequestModel(
      name: json["name"],
      username: json["username"],
      email: json["email"],
      password: json["password"],
      phonenumber: json["phonenumber"],
      address: json["address"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "username": username,
      "email": email,
      "phonenumber": phonenumber,
      "address": address,
    };
  }
//



}