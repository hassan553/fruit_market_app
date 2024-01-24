import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/features/home/data/model/product_model.dart';
import 'package:fruit_market_app/features/home/data/local_database/local_data.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  HomeLocalDatabase localDatabase;
  FavoriteCubit(this.localDatabase) : super(FavoriteInitial());
  static FavoriteCubit get(context) => BlocProvider.of(context);
  List<ProductModel> productList = [];
  getAllFavorite() async {
    var result = localDatabase.getData();
    result.then((value) {
      value.fold((l) {
        emit(FavoriteError());
      }, (r) {
        productList = r;
        emit(FavoriteSuccess());
      });
    });
  }
}
