import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
   var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var addressController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  // Future userRegister(
  //     {required String email,
  //     required String password,
  //     required int phone,
  //     required String name}) async {
  //   emit(RegisterLoadingState());
  //   var result = await registerRepository.register(
  //       email: email, password: password, phone: phone, name: name);
  //   result.fold((l) {
  //     emit(RegisterErrorState(l));
  //   }, (r) {
  //     if (r.status == false) {
  //       emit(RegisterErrorState(r.message.toString()));
  //     } else {
  //       emit(RegisterSuccessState(r));
  //     }
  //   });
  // }
}