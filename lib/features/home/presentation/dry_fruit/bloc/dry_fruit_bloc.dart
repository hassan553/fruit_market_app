import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/enums/app_state.dart';
import '../../../model/collection_model.dart';
import '../../../model/product_model.dart';
import '../../../services/home_repositry.dart/fruit_repositry.dart';

part 'dry_fruit_event.dart';
part 'dry_fruit_state.dart';

//stone melons
class DryFruitBloc extends Bloc<DryFruitEvent, DryFruitState> {
  List<ProductModel> organicFruitList = [];
  List<ProductModel> mixedDryFruitList = [];
  DryFruitBloc() : super(const DryFruitState()) {
    on<GetOrganicDryFruitEvent>((event, emit) async {
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
    on<GetMixedDryFruitEvent>((event, emit) async {
      var result = await FruitRepository().getOrganicFruitProducts();
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
  }
}
