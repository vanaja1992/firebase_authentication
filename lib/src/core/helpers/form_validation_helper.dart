import '../constants/app_strings.dart';

class FormValidationHelper {
  ///Regex Email
  ///Validate Email
  ///Validate Password
  ///Validate Username

  // validate email
  static String? validateEmail(String? email) {
     if(email== null){
       return AppStrings.emailEmptyErrorMessage;
     }
     email = email.trim();
    if (email.isEmpty) {
      return AppStrings.emailEmptyErrorMessage;
    } else if (email.length < 8) {
      return AppStrings.emailValidErrorMessage;
    } else if (!AppStrings.emailRegex.hasMatch(email)) {

    } else {
      return null;
    }
    return null;
  }

  static String? validateUname(String? uname) {
    if(uname== null){
      return AppStrings.unameEmptyErrorMessage;
    }
    uname = uname.trim();
    if (uname.isEmpty) {
      return AppStrings.unameEmptyErrorMessage;
    }  else if (!AppStrings.unameRegex.hasMatch(uname)) {
      return AppStrings.unameIncorrectErrorMessage;
    } else {
      return null;
    }
  }

  // validate password
  static String? validatePassword(String? password) {
    if(password == null){
      return AppStrings.emailEmptyErrorMessage;
    }
    password = password.trim();
     if (password.isEmpty) {
      return AppStrings.passwordEmptyErrorMessage;
    } else if (password.length < 5) {
      return AppStrings.passwordIncorrectErrorMessage;
    } else {
      return null;
    }
  }

  // validate username
  static String? validateUsername(String? username) {
    if(username == null){
      return AppStrings.emailEmptyErrorMessage;
    }
    username = username.trim();
     if (username.isEmpty) {
      return AppStrings.userdEmptyErrorMessage;
    } else if (username.length < 3) {
      return AppStrings.userIncorrectErrorMessage;
    } else {
      return null;
    }
  }

// validate username
  static String? validatePhonenumber(String? phonenumber) {
    if(phonenumber == null){
      return AppStrings.emailEmptyErrorMessage;
    }
    phonenumber = phonenumber.trim();
    if (phonenumber.isEmpty) {
      return AppStrings.userdEmptyErrorMessage;
    } else if (phonenumber.length < 10 && phonenumber.length > 10) {
      return AppStrings.userIncorrectErrorMessage;
    } else {
      return null;
    }
  }


}
