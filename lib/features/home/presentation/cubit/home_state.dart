part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class IncrementCounter extends HomeState {}

class DecrementCounter extends HomeState {}

class ChangeIsFavoriteState extends HomeState {}

class AddToFavoriteState extends HomeState {}

class DeleteFromFavoriteState extends HomeState {}

class ChangeCurrentIndexState extends HomeState {}

class GetUserData extends HomeState {
  GetUserData();
}

class GetUserDataErrorState extends HomeState {
  String error;
  GetUserDataErrorState(this.error);
}

class GetUserPictureSuccessState extends HomeState {}

class GetUserPictureErrorState extends HomeState {}

class ChangeBottomNavigationCurrentIndexState extends HomeState {}

class AddUserOrderSuccessState extends HomeState {}

class AddUserOrderErrorState extends HomeState {}

class AddUserOrderLoadingState extends HomeState {}

class GetUserOrdersSuccessState extends HomeState {}

class GetUserOrdersErrorState extends HomeState {}

class GetUserOrdersLoadingState extends HomeState {}
