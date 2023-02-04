part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginValidEmailState extends LoginState {}

class LoginValidPasswordState extends LoginState {}
