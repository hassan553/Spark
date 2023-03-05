import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/user_model.dart';
import '../../../data/repository/login_repo.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepository loginRepository;
  LoginCubit(this.loginRepository) : super(LoginInitial());
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

  Future userLogin(String email, String password) async {
    emit(LoginLoadingState());
    var result = await loginRepository.login(email, password);
    result.fold((l) {
      emit(LoginErrorState(l));
    }, (r) {
      if (r.status == false) {
        emit(LoginErrorState(r.message.toString()));
      } else {
        emit(LoginSuccessState(r));
      }
    });
  }
}
