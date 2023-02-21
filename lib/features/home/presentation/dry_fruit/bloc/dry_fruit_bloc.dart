import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_market_app/features/home/services/home_repositry.dart/dry_fruit_repository.dart';

import '../../../../../core/enums/app_state.dart';
import '../../../model/collection_model.dart';
import '../../../model/product_model.dart';
import '../../../services/home_repositry.dart/fruit_repositry.dart';

part 'dry_fruit_event.dart';
part 'dry_fruit_state.dart';

//stone melons
class DryFruitBloc extends Bloc<DryFruitEvent, DryFruitState> {
  List<ProductModel> indehiscentFruitList = [];
  List<ProductModel> dehiscentFruitList = [];
  List<ProductModel> kashmiriDryFruitList = [];

  List<ProductModel> mixedDryFruitList = [];
  DryFruitBloc() : super(const DryFruitState()) {
    on<GetIndehiscentDryFruitEvent>((event, emit) async {
      var result = await DryFruitsRepository().getIndehiscentDryProducts();
      result.fold((error) {
        emit(state.copyWith(
            indehiscentState: RequestState.error,
            indehiscentErrorMessage: error.toString()));
      }, (value) async {
        Map<String, dynamic> data = value.data() as Map<String, dynamic>;

        CollectionModel collectionModel = CollectionModel(
          priceOff: data['price_off'],
          subTitle: data['sub_title'],
          title: data['title'],
          products: data['products'],
        );
        collectionModel.products.forEach((element) {
          indehiscentFruitList.add(ProductModel.fromJson(element));
        });
        print(collectionModel.subTitle);
        emit(
          state.copyWith(
            indehiscentState: RequestState.loaded,
            indehiscentCollection: collectionModel,
          ),
        );
      });
    });
    on<GetDehiscentDryFruitEvent>((event, emit) async {
      var result = await DryFruitsRepository().getDehiscentDryProducts();
      result.fold((error) {
        emit(state.copyWith(
            dehiscentState: RequestState.error,
            dehiscentErrorMessage: error.toString()));
      }, (value) async {
        Map<String, dynamic> data = value.data() as Map<String, dynamic>;

        CollectionModel collectionModel = CollectionModel(
          priceOff: data['price_off'],
          subTitle: data['sub_title'],
          title: data['title'],
          products: data['products'],
        );
        collectionModel.products.forEach((element) {
          dehiscentFruitList.add(ProductModel.fromJson(element));
        });
        print(collectionModel.subTitle);
        emit(
          state.copyWith(
            dehiscentState: RequestState.loaded,
            dehiscentCollection: collectionModel,
          ),
        );
      });
    });

    on<GetMixedDryFruitEvent>((event, emit) async {
      var result = await DryFruitsRepository().getMixedDryProducts();
      result.fold((error) {
        emit(state.copyWith(
            mixedDryFruitState: RequestState.error,
            mixedDryFruitErrorMessage: error.toString()));
      }, (value) async {
        Map<String, dynamic> data = value.data() as Map<String, dynamic>;

        CollectionModel collectionModel = CollectionModel(
          priceOff: data['price_off'],
          subTitle: data['sub_title'],
          title: data['title'],
          products: data['products'],
        );
        collectionModel.products.forEach((element) {
          mixedDryFruitList.add(ProductModel.fromJson(element));
        });
        print(collectionModel.subTitle);
        emit(
          state.copyWith(
            mixedDryFruitState: RequestState.loaded,
            mixedDryFruitCollection: collectionModel,
          ),
        );
      });
    });
     on<GetKashmiriDryFruitEvent>((event, emit) async {
      var result = await DryFruitsRepository().getKashmiriDryFruitProducts();
      result.fold((error) {
        emit(state.copyWith(
            kashmiriDryFruitState: RequestState.error,
            kashmiriDryFruitErrorMessage: error.toString()));
      }, (value) async {
        Map<String, dynamic> data = value.data() as Map<String, dynamic>;

        CollectionModel collectionModel = CollectionModel(
          priceOff: data['price_off'],
          subTitle: data['sub_title'],
          title: data['title'],
          products: data['products'],
        );
        collectionModel.products.forEach((element) {
          kashmiriDryFruitList.add(ProductModel.fromJson(element));
        });
        print(collectionModel.subTitle);
        emit(
          state.copyWith(
            kashmiriDryFruitState: RequestState.loaded,
            kashmiriDryFruitCollection: collectionModel,
          ),
        );
      });
    });
  }
}
