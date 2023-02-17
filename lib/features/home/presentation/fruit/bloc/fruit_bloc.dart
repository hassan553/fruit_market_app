import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/enums/app_state.dart';
import '../../../model/collection_model.dart';
import '../../../model/product_model.dart';
import '../../../services/home_repositry.dart/fruit_repositry.dart';

part 'fruit_event.dart';
part 'fruit_state.dart';

class FruitBloc extends Bloc<FruitEvent, FruitState> {
  List<ProductModel> organicFruitList = [];
  List<ProductModel> mixedFruitList = [];
    List<ProductModel> stoneFruitList = [];
  List<ProductModel> melonsFruitList = [];
  FruitBloc() : super(const FruitState()) {
    on<GetOrganicFruitEvent>((event, emit) async {
      var result = await FruitRepository().getOrganicFruitProducts();
      result.fold((error) {
        emit(state.copyWith(
            organicState: RequestState.error,
            organicErrorMessage: error.toString()));
      }, (value) async {
        Map<String, dynamic> data = value.data() as Map<String, dynamic>;

        CollectionModel collectionModel = CollectionModel(
          priceOff: data['price_off'],
          subTitle: data['sub_title'],
          title: data['title'],
          products: data['products'],
        );
        collectionModel.products.forEach((element) {
          organicFruitList.add(ProductModel.fromJson(element));
        });
        print(collectionModel.subTitle);
        emit(
          state.copyWith(
            organicState: RequestState.loaded,
            organicCollection: collectionModel,
          ),
        );
      });
    });
    on<GetMixedFruitEvent>((event, emit) async {
      var result = await FruitRepository().getMixedFruitProducts();
      result.fold((error) {
        emit(state.copyWith(
            mixedFruitState: RequestState.error,
            mixedFruitErrorMessage: error.toString()));
      }, (value) async {
        Map<String, dynamic> data = value.data() as Map<String, dynamic>;

        CollectionModel collectionModel = CollectionModel(
          priceOff: data['price_off'],
          subTitle: data['sub_title'],
          title: data['title'],
          products: data['products'],
        );
        collectionModel.products.forEach((element) {
          mixedFruitList.add(ProductModel.fromJson(element));
        });
        print(collectionModel.subTitle);
        emit(
          state.copyWith(
            mixedFruitState: RequestState.loaded,
            mixedFruitCollection: collectionModel,
          ),
        );
      });
    });
     on<GetStoneFruitEvent>((event, emit) async {
      var result = await FruitRepository().getStoneFruitProducts();
      result.fold((error) {
        emit(state.copyWith(
            stoneFruitState: RequestState.error,
            stoneFruitErrorMessage: error.toString()));
      }, (value) async {
        Map<String, dynamic> data = value.data() as Map<String, dynamic>;

        CollectionModel collectionModel = CollectionModel(
          priceOff: data['price_off'],
          subTitle: data['sub_title'],
          title: data['title'],
          products: data['products'],
        );
        collectionModel.products.forEach((element) {
          stoneFruitList.add(ProductModel.fromJson(element));
        });
        print(collectionModel.subTitle);
        emit(
          state.copyWith(
            stoneFruitState: RequestState.loaded,
            stoneFruitCollection: collectionModel,
          ),
        );
      });
    });
    on<GetMelonsFruitEvent>((event, emit) async {
      var result = await FruitRepository().getMelonsFruitProducts();
      result.fold((error) {
        emit(state.copyWith(
            melonsState: RequestState.error,
            melonsErrorMessage: error.toString()));
      }, (value) async {
        Map<String, dynamic> data = value.data() as Map<String, dynamic>;

        CollectionModel collectionModel = CollectionModel(
          priceOff: data['price_off'],
          subTitle: data['sub_title'],
          title: data['title'],
          products: data['products'],
        );
        collectionModel.products.forEach((element) {
          melonsFruitList.add(ProductModel.fromJson(element));
        });
        print(collectionModel.subTitle);
        emit(
          state.copyWith(
            melonsState: RequestState.loaded,
            melonsCollection: collectionModel,
          ),
        );
      });
    });
  }
  
}
