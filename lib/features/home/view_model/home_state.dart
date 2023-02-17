part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeCurrentIndexState extends HomeState {}

class ChangeBottomNavigationCurrentIndexState extends HomeState {}

class DehiscentDryFruitLoadingState extends HomeState {}

class DehiscentDryFruitSuccessState extends HomeState {
  final CollectionModel collectionModel;
  DehiscentDryFruitSuccessState(this.collectionModel);
}

class DehiscentDryFruitErrorState extends HomeState {
  final String error;
  DehiscentDryFruitErrorState(this.error);
}
