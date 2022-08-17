part of 'reset_password_cubit.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();
}

class ResetPasswordInitial extends ResetPasswordState {
  @override
  List<Object> get props => [];
}
class ResetPasswordLoading extends ResetPasswordState {
  @override
  List<Object> get props => [];
}
class ResetPasswordSuccess extends ResetPasswordState {
  final String successMessge;

  ResetPasswordSuccess(this.successMessge);

  @override
  List<Object> get props => [successMessge];
}
class ResetPasswordError extends ResetPasswordState {
 final String errorMessage;

   const ResetPasswordError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}