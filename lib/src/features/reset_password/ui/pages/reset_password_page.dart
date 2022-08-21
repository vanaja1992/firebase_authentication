import 'package:firebase_authentication/src/features/authentication/ui/pages/login_page.dart';
import 'package:firebase_authentication/src/features/reset_password/cubit/reset_password_cubit.dart';
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
import '../../../authentication/cubit/authentication_cubit.dart';
class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final GlobalKey<FormState>  _formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
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

                          Text(
                            AppStrings.resetPasswordTitle,
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
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                          BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                            listener: (_, state) {
                              if(state is ResetPasswordInitial || state is ResetPasswordLoading){
                                EasyLoading.show(status: AppStrings.loading);
                              }
                              else if (state is ResetPasswordError) {
                                EasyLoading.dismiss();
                                clearField();
                                PopupMessageToast.showMessageToast(state.errorMessage);
                              }
                              else if (state is ResetPasswordSuccess) {
                                // EasyLoading.dismiss();
                                PopupMessageToast.showMessageToast(state.successMessge);
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
                                    title: AppStrings.resetPasswordTitle,
                                    onTap: () {
                                      if (!(_formKey.currentState?.validate() ??
                                          false)) {
                                        return;
                                      }
                                      context
                                          .read<ResetPasswordCubit>()
                                          .forgotPassword(
                                          emailController.text,
                                        );
                                    });
                              }

                            },
                          ),
                          const SizedBox(
                            height: 17,
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
}

  void clearField() {
    emailController.clear();
  }

  void navigatePage() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const LoginPage()));
  }
  }
