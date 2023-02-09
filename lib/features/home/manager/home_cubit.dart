import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rakna/features/home/views/home_view.dart';
import 'package:rakna/features/notification_view.dart/views/notification_view.dart';
import 'package:rakna/features/setting/views/setting_view.dart';

import '../widgets/home_body.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
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
}
