import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/features/cart/repo/cart_repo.dart';
import 'package:fruit_market_app/features/home/model/product_model.dart';

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
}
