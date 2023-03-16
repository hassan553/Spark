import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/repository/login_repo.dart';

class LoginController extends GetxController {
  LoginRepository loginRepository = LoginRepositoryImpl();
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  validEmail(value) {
    if (value.isEmpty) {
      return 'not valid empty value';
    } else if (value.contains('@')) {
      return 'not valid email ';
    }
    update();
  }

  validPassword(value) {
    if (value.isEmpty) {
      return 'not valid empty value';
    } else if (value.length < 8) {
      return 'short password length ';
    }
    update();
  }

  // Future userLogin(String email, String password) async {
  //   emit(LoginLoadingState());
  //   var result = await loginRepository.login(email, password);
  //   result.fold((l) {
  //     emit(LoginErrorState(l));
  //   }, (r) {
  //     if (r.status == false) {
  //       emit(LoginErrorState(r.message.toString()));
  //     } else {
  //       emit(LoginSuccessState(r));
  //     }
  //   });
  // }
}
