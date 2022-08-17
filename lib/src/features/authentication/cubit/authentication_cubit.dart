import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/src/features/authentication/cubit/authentication_repository.dart';
import 'package:firebase_authentication/src/features/authentication/model/user_request_model.dart';

import '../../../core/constants/app_strings.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationRepository authenticationRepository;
  AuthenticationCubit(this.authenticationRepository)
      : super(AuthenticationInitial());
  final List<UserRequestModel> _userModel = [];
  UserCredential? userCredential;
  loginUser(String email, String password) async {
    emit(AuthenticationLoading());
    UserCredential? userCredential =
        await authenticationRepository.login(email, password);

    if (userCredential == null) {
      emit(const AuthenticationFailure(AppStrings.errorMessage));
    } else {

      emit(AuthenticationSuccess(userCredential));
    }
  }

  signUpUser(UserRequestModel userRequestModel) async {
    UserCredential? userCredential;
    emit(AuthenticationLoading());
    _userModel.add(userRequestModel);
    userCredential = await authenticationRepository.signup(userRequestModel);
    if (userCredential == null) {
      emit(const AuthenticationFailure(AppStrings.errorMessage));
    } else {
      emit(AuthenticationSuccess(userCredential));
    }
  }



}