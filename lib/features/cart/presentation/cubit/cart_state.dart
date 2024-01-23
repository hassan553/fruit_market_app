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
  final List<ProductModel> list;
  const GetFromCartSuccessState(this.list);
}

class RemoveFromCartLoadingState extends CartState {}

class RemoveFromCartErrorState extends CartState {
  final String error;
  const RemoveFromCartErrorState(this.error);
}

class RemoveFromCartSuccessState extends CartState {
  const RemoveFromCartSuccessState();
}

class AddToCartLoadingState extends CartState {}

class AddToCartSuccessState extends CartState {}

class AddToCartErrorState extends CartState {
  final String error;
  const AddToCartErrorState(this.error);
}
