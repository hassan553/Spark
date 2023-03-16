import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rakna/main.dart';
import '../../auth/data/model/user_model.dart';
import '../data/repository/home_repo.dart';
import '../views/home_view.dart';
import '../../notification_view.dart/views/notification_view.dart';
import '../../setting/views/setting_view.dart';

import '../widgets/home_body.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepo homeRepo = HomeRepo();
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int bottomNavigationCurrentIndex = 0;
  void changeBottomNavigationCurrentIndex(int index) {
    bottomNavigationCurrentIndex = index;
    emit(ChangeBottomNavigationCurrentIndexState());
  }

  List<Widget> screens = const [
    HomeBody(),
    NotificationView(),
    SettingView(),
  ];
  UserModel? userModel;
  Future getUserData() async {
    String? token = sharedPreferences.getString('token');
    var result = await homeRepo.getUserProfile(token!);
    result.fold((l) {
      emit(GetUserDataError());
    }, (r) {
      userModel = r;
      emit(GetUserDataSuccess());
    });
  }

  chooseImageFromCamera() async {
    String? token = sharedPreferences.getString('token');
    try {
      await homeRepo.chooseImage().then((value) {
        homeRepo.uploadImage(token!);
        print('Success uplaod');
        emit(UpdateUserImageSuccess());
      });
    } catch (error) {
      print('Success ${error.toString()}');
      emit(UpdateUserImageError());
    }
  }
}
