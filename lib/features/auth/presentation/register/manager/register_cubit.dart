import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/user_model.dart';
import '../../../data/repository/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterRepository registerRepository;
  RegisterCubit(this.registerRepository) : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var addressController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  
  Future userRegister(
      {required String email,
      required String password,
      required int phone,
      required String name}) async {
    emit(RegisterLoadingState());
    var result = await registerRepository.register(email:email, password: password,phone: phone,name: name);
    result.fold((l) {
      emit(RegisterErrorState(l));
    }, (r) {
      if (r.status == false) {
        emit(RegisterErrorState(r.message.toString()));
      } else {
        emit(RegisterSuccessState(r));
      }
    });
  }
}
