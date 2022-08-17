import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/src/features/reset_password/cubit/reset_password_repository.dart';

import '../../../core/constants/app_strings.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordRepository resetPasswordRepository;
  ResetPasswordCubit(this.resetPasswordRepository) : super(ResetPasswordInitial());


  forgotPassword(String email) async {
   emit(ResetPasswordLoading());
    try{
     await resetPasswordRepository.forgotPassword(email);
     emit(ResetPasswordSuccess(AppStrings.successResetPasswordMessage));
    }
    catch(ex){
      emit( const ResetPasswordError(AppStrings.errorResetPasswordMessage));
    }
  }
}
