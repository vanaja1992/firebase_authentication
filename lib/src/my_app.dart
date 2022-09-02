import 'package:firebase_authentication/src/core/constants/app_colors.dart';
import 'package:firebase_authentication/src/core/constants/app_strings.dart';
import 'package:firebase_authentication/src/features/authentication/ui/pages/login_page.dart';
import 'package:firebase_authentication/src/features/reset_password/cubit/reset_password_cubit.dart';
import 'package:firebase_authentication/src/features/reset_password/cubit/reset_password_repository.dart';
import 'package:firebase_authentication/src/features/todo/cubit/todo_cubit.dart';
import 'package:firebase_authentication/src/features/todo/cubit/todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/authentication/cubit/authentication_cubit.dart';
import 'features/authentication/cubit/authentication_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationCubit(AuthenticationRepository()),
        ),
        // BlocProvider(
        //   create: (context) => ResetPasswordCubit(ResetPasswordRepository()),
        // ),
        BlocProvider(
          create: (context) => TodoCubit(TodoRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appTitle,
        theme: ThemeData(
            primaryColor: AppColors.primaryColor
        ),
        home: const LoginPage(),
      ),
    );
  }
}
