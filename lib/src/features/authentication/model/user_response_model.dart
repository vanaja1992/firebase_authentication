import 'package:firebase_authentication/src/features/authentication/model/user_request_model.dart';

class UserResponseModel{
  UserRequestModel userRequestModel;
   String userId;

  UserResponseModel({required this.userRequestModel, required this.userId});

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      userRequestModel: UserRequestModel.fromJson(json["userResponseModel"]),
      userId: json["userId"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userResponseModel": userRequestModel.toJson(),
      "userId": userId,
    };
  }
//

}