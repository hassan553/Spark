import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  validEmail(value) {
    if (value.isEmpty) {
      return 'not valid empty value';
    } else if (value.contains('@')) {
      return 'not valid email ';
    }
    emit(LoginValidEmailState());
  }

  validPassword(value) {
    if (value.isEmpty) {
      return 'not valid empty value';
    } else if (value.length < 8) {
      return 'short password length ';
    }
    emit(LoginValidPasswordState());
  }

  disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
    
  }
}
