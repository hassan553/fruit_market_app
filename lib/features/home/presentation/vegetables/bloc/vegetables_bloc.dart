import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_market_app/features/home/services/home_repositry.dart/vegetables-repository.dart';
import 'package:print_color/print_color.dart';
import '../../../../../core/enums/app_state.dart';
import '../../../model/collection_model.dart';
import '../../../model/product_model.dart';
part 'vegetables_event.dart';
part 'vegetables_state.dart';

class VegetablesBloc extends Bloc<VegetablesEvent, VegetablesState> {
  List<ProductModel> organicList = [];
  List<ProductModel> mixedList = [];
  List<ProductModel> rootList = [];
  List<ProductModel> alliumList = [];
  VegetablesBloc() : super(const VegetablesState()) {
    on<GetOrganicVegetablesEvent>((event, emit) async {
      var result = await VegetablesRepository().getOrganicVegetablesProducts();
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
          organicList.add(ProductModel.fromJson(element));
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
    on<GetMixedVegetablesEvent>((event, emit) async {
      var result = await VegetablesRepository().getMixedVegetablesProducts();
      result.fold((error) {
        Print.red(error.toString());
        emit(state.copyWith(
            mixedVegetablesState: RequestState.error,
            mixedVegetablesErrorMessage: error.toString()));
      }, (value) async {
        Map<String, dynamic> data = value.data() as Map<String, dynamic>;

        CollectionModel collectionModel = CollectionModel(
          priceOff: data['price_off'],
          subTitle: data['sub_title'],
          title: data['title'],
          products: data['products'],
        );
        collectionModel.products.forEach((element) {
          mixedList.add(ProductModel.fromJson(element));
        });
        Print.green(collectionModel.subTitle);
        emit(
          state.copyWith(
            mixedVegetablesState: RequestState.loaded,
            mixedVegetablesCollection: collectionModel,
          ),
        );
      });
    });
    on<GetRootVegetablesEvent>((event, emit) async {
      var result = await VegetablesRepository().getRootVegetablesProducts();
      result.fold((error) {
        emit(state.copyWith(
            rootState: RequestState.error, rootErrorMessage: error.toString()));
      }, (value) async {
        Map<String, dynamic> data = value.data() as Map<String, dynamic>;

        CollectionModel collectionModel = CollectionModel(
          priceOff: data['price_off'],
          subTitle: data['sub_title'],
          title: data['title'],
          products: data['products'],
        );
        collectionModel.products.forEach((element) {
          rootList.add(ProductModel.fromJson(element));
        });
        print(collectionModel.subTitle);
        emit(
          state.copyWith(
            rootState: RequestState.loaded,
            rootCollection: collectionModel,
          ),
        );
      });
    });
    on<GetAlliumVegetablesEvent>((event, emit) async {
      var result = await VegetablesRepository().getAlliumVegetablesProducts();
      result.fold((error) {
        emit(state.copyWith(
            alliumState: RequestState.error,
            alliumErrorMessage: error.toString()));
      }, (value) async {
        Map<String, dynamic> data = value.data() as Map<String, dynamic>;

        CollectionModel collectionModel = CollectionModel(
          priceOff: data['price_off'],
          subTitle: data['sub_title'],
          title: data['title'],
          products: data['products'],
        );
        collectionModel.products.forEach((element) {
          alliumList.add(ProductModel.fromJson(element));
        });
        print(collectionModel.subTitle);
        emit(
          state.copyWith(
            alliumState: RequestState.loaded,
            alliumCollection: collectionModel,
          ),
        );
      });
    });
  }
}
