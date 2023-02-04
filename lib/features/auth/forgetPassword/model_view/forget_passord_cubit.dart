import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'forget_passord_state.dart';

class ForgetPassWordCubit extends Cubit<ForgetPassordState> {
  ForgetPassWordCubit() : super(ForgetPassordInitial());
  static ForgetPassWordCubit get(context) => BlocProvider.of(context);
  var passWordController = TextEditingController();
}
