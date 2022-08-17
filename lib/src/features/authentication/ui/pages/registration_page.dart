import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../../core/assets/app_assets.dart';
import '../../../../core/common_widgets/app_button.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/helpers/form_validation_helper.dart';
import '../../../../core/helpers/popup_message_toast.dart';
import '../../../../core/theme/app_login_border_decoration.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/theme/input_decoration_theme.dart';
import '../../../pages/home_page.dart';
import '../../cubit/authentication_cubit.dart';
import '../../model/user_request_model.dart';
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState>  _formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController unameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController userController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(AppAssets.loginBg,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 15),
                child: Center(
                  child: Container(
                    decoration:
                    AppLoginBorderDecoration.appLoginBorderDecoration(),
                    child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          AppStrings.signupTitle,
                          style: AppTextTheme.inputTextStyle1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: unameController,
                                  decoration: InputDecorationThemes
                                      .formInputDecoration
                                      .copyWith(labelText: AppStrings.usercname),
                                  validator: (val) {
                                    return FormValidationHelper.validateUname(
                                        val);
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: emailController,
                                  decoration: InputDecorationThemes
                                      .formInputDecoration
                                      .copyWith(labelText: AppStrings.emailid),
                                  validator: (val) {
                                    return FormValidationHelper.validateEmail(
                                        val);
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.phone,
                                  controller: phoneController,
                                  decoration: InputDecorationThemes
                                      .formInputDecoration
                                      .copyWith(labelText: AppStrings.phone),
                                  validator: (val) {
                                    return FormValidationHelper.validatePhonenumber(
                                        val);
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: userController,
                                  decoration: InputDecorationThemes
                                      .formInputDecoration
                                      .copyWith(labelText: AppStrings.username),
                                  validator: (val) {
                                    return FormValidationHelper.validateUname(
                                        val);
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  decoration: InputDecorationThemes
                                      .formInputDecoration
                                      .copyWith(labelText: AppStrings.password_,),
                                  obscureText: true,
                                  validator: (val) {
                                    return FormValidationHelper.validatePassword(
                                        val);
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: cpasswordController,
                                  decoration: InputDecorationThemes
                                      .formInputDecoration
                                      .copyWith(labelText: AppStrings.cpassword,),
                                  validator: (val) {
                                    return FormValidationHelper.validatePassword(
                                        val);
                                    // if(passwordController == cpasswordController){
                                    //
                                    // }
                                    // else{
                                    //   return AppStrings.errorMessageSignup;
                                    // }

                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: addressController,
                                  decoration: InputDecorationThemes
                                      .formInputDecoration
                                      .copyWith(labelText: AppStrings.address,),

                                  validator: (val) {
                                    return FormValidationHelper.validateUname(
                                        val);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        BlocConsumer<AuthenticationCubit, AuthenticationState>(
                          listener: (_, state) {
                            if(state is AuthenticationInitial || state is AuthenticationLoading){
                              EasyLoading.show(status: AppStrings.loading);
                            }
                            else if (state is AuthenticationFailure) {
                              EasyLoading.dismiss();
                              clearField();
                              PopupMessageToast.showMessageToast(state.errorMessage);
                            }
                            else if (state is AuthenticationSuccess) {
                              // EasyLoading.dismiss();
                              navigatePage();
                            }
                            else{

                            }
                          },
                          builder: (_, state) {
                            if (state is AuthenticationLoading) {
                              return Container();
                            }  else  {
                              return AppButton(
                                  title: AppStrings.signupButton,
                                  onTap: () {
                                    if (!(_formKey.currentState?.validate() ??
                                        false)) {
                                      return;
                                    }
                                   UserRequestModel userModel=  UserRequestModel(
                                        name: unameController.text,
                                        username:userController.text ,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        phonenumber: phoneController.text,
                                        address: addressController.text);
                                    context.read<AuthenticationCubit>().signUpUser(userModel);
                                    // context
                                    //     .read<AuthenticationCubit>()
                                    //     .signUpUser(
                                    //     emailController.text.toString(),
                                    //     passwordController.text.toString());
                                  });
                            }

                          },
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                         Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Text(
                                  AppStrings.newlogin,
                                  style: AppTextTheme.body,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: InkWell(
                                  child: Text(
                                    AppStrings.login,
                                    style: AppTextTheme.body1,
                                  ),
                                  onTap: (){
                                    navigatePage();
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void navigatePage() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const HomePage()));
  }

  void clearField() {
    emailController.clear();
    passwordController.clear();
  }
}
