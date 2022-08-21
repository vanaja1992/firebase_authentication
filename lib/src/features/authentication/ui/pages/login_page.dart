import 'package:firebase_authentication/src/features/authentication/ui/pages/registration_page.dart';
import 'package:firebase_authentication/src/features/reset_password/ui/pages/reset_password_page.dart';
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
import '../../../../pages/home_page.dart';
import '../../cubit/authentication_cubit.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState>  _formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                padding: const EdgeInsets.symmetric(vertical: 110, horizontal: 15),
                child: Center(
                  child: Container(
                    decoration:
                    AppLoginBorderDecoration.appLoginBorderDecoration(),
                    child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top:80),
                          child: Center(
                            child: Image(
                              image: AssetImage(AppAssets.loginHeadImage),
                              height: 100,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          AppStrings.signTitle,
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
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              child: Text(
                                AppStrings.forgotPassword,
                                style: AppTextTheme.body,
                              ),
                              onTap: (){
                                navigateResetPasswordPage();
                              },
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
                                  title: AppStrings.login,
                                  onTap: () {
                                    if (!(_formKey.currentState?.validate() ??
                                        false)) {
                                      return;
                                    }
                                    context
                                        .read<AuthenticationCubit>()
                                        .loginUser(
                                        emailController.text.toString(),
                                        passwordController.text.toString());
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
                                  AppStrings.newlogintext,
                                  style: AppTextTheme.body,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: InkWell(
                                  child: Text(
                                    AppStrings.registerNow,
                                    style: AppTextTheme.body1,
                                  ),
                                  onTap: (){
                                    navigateSignupPage();
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
  void navigateSignupPage() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const RegistrationPage()));
  }

  void clearField() {
    emailController.clear();
    passwordController.clear();
  }

  void navigateResetPasswordPage() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const ResetPasswordPage()));
  }
}
