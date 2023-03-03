part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class GetFromCartLoadingState extends CartState {}

class GetFromCartErrorState extends CartState {}

class GetFromCartSuccessState extends CartState {
  List<ProductModel> list;
  GetFromCartSuccessState(this.list);
}

class RemoveFromCartLoadingState extends CartState {}

class RemoveFromCartErrorState extends CartState {}

class RemoveFromCartSuccessState extends CartState {
  List<ProductModel> list;
  RemoveFromCartSuccessState(this.list);
}

