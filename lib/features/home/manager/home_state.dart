part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeBottomNavigationCurrentIndexState extends HomeState {}

class GetUserDataSuccess extends HomeState {}

class GetUserDataError extends HomeState {}
class UpdateUserImageSuccess extends HomeState {}
class UpdateUserImageError extends HomeState {}
