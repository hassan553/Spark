part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginValidEmailState extends LoginState {}

class LoginValidPasswordState extends LoginState {}

class LoginSuccessState extends LoginState {
  final UserModel userModel;
  LoginSuccessState(this.userModel);
}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
}

class LoginLoadingState extends LoginState {}
