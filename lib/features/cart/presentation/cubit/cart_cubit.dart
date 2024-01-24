import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/features/cart/data/repo/cart_repo.dart';
import 'package:fruit_market_app/features/home/data/model/product_model.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartRepository cartRepository;
  CartCubit(this.cartRepository) : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);
  Future getAllCartItems() async {
    emit(GetFromCartLoadingState());
    var result = await cartRepository.getFromCart();
    result.fold((l) {
      emit(GetFromCartErrorState());
    }, (r) {
      emit(GetFromCartSuccessState(r));
    });
  }

  Future addCartItems(ProductModel model) async {
    emit(AddToCartLoadingState());
    var result = await cartRepository.addToCart(model);
    result.fold((l) {
      emit(AddToCartErrorState(l));
    }, (_) {
      emit(AddToCartSuccessState());
    });
  }

  Future removeCartItems(int id) async {
    emit(RemoveFromCartLoadingState());
    var result = await cartRepository.removeFromCart(id);
    result.fold((l) {
      emit(RemoveFromCartErrorState(l));
    }, (_) {
      emit(const RemoveFromCartSuccessState());
    });
  }
}
