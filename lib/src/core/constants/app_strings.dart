class AppStrings{
///Core
  ///Login Page
  ///Validation
  ///Signup
  ///


  //Core
  static const String appTitle = "Firebase TODO";
//Login Page
  static const String login ="Login";
  static const String helloTitle = "Hello";
  static const String signTitle = "Sign into your account";
  static const String username = "Username";
  static const String password_ = "Password";
  static const String forgotPassword = "Forgot Password?";
  static const String loginButton = "Login";
  static const String newlogintext = "Don't have an account?";
  static const String registerNow = "Register Now";
  static const String errorMessage = "Invalid username or password";
  static const String loading = "Loading";

  //Signup Page

  static const String signupTitle = "Register";
  static const String signupButton = "Register Now";
  static const String username_ = "Username";
  static const String password = "Password";
  static const String cpassword = "Confirm Password";
  static const String emailid = "Email Id";
  static const String usercname = "Name";
  static const String phone = "Phone Number";
  static const String address = "Address";
  static const String errorMessageSignup = "password mismatch";
  static const String newlogin = "Already have account?";

  // Validation
  static const String emailEmptyErrorMessage = "Please enter email";
  static const String unameEmptyErrorMessage = "Please enter your name";
  static const String emailValidErrorMessage = "Please enter a valid email address";
   static const String emailIncorrectErrorMessage = "Invalid email address";
  static const String  unameIncorrectErrorMessage = "Invalid Name Format";
  static const String passwordEmptyErrorMessage = "Please enter password";
  static const String passwordValidErrorMessage = "Please enter a valid password";
  static const String passwordIncorrectErrorMessage = "Invalid password";
  static const String userdEmptyErrorMessage = "Please enter username";
  static const String userIncorrectErrorMessage = "Invalid username";

  //Regex
  static RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static RegExp unameRegex = RegExp('[a-zA-Z]');
  static RegExp phoneRegex = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');


  //Home Page
  static const String homeTitle = "Hello";

  //Resetpassword page
  static const String errorResetPasswordMessage = "Invalid email id";
  static const String successResetPasswordMessage = "Successfully send reset password link to your registered  mail id ";
  static const String resetPasswordTitle = "Reset Password";

}