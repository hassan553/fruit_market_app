import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/core/uitls/app_assets.dart';
import 'package:fruit_market_app/features/auth/model/user_model.dart';
import 'package:fruit_market_app/features/home/model/collection_model.dart';
import 'package:fruit_market_app/features/home/presentation/home_view.dart';
import 'package:fruit_market_app/features/home/services/local_database/local_data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:print_color/print_color.dart';
import '../../cart/presentation/views/cart_view.dart';
import '../../favourite/presentation/views/favourite_view.dart';
import '../../setting/presentation/views/setting_view.dart';
import '../model/order_model.dart';
import '../model/product_model.dart';
import '../services/home_repositry.dart/home_repository.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository homeRepository;
  LocalDatabase localDatabase;
  HomeCubit(this.homeRepository, this.localDatabase) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 1;
  int bottomNavigationCurrentIndex = 0;
  List<String> categoriesString = ['Vegetables', 'Fruits', 'Dry fruits'];
  List<Widget> screens = const [
    HomeView(),
    CartView(),
    FavoriteView(),
    SettingView(),
  ];
  List<AppBar> appBarList = [
    AppBar(),
    AppBar(),
    AppBar(),
    AppBar(),
  ];
  List<String> carouselImagesList = [
    AppAssets.images4,
    AppAssets.images5,
    AppAssets.images6,
    AppAssets.images7,
  ];
  void changeCategoryIndex(int index) {
    currentIndex = index;
    emit(ChangeCurrentIndexState());
  }

  int counter = 0;
  void incrementCounter() {
    ++counter;
    emit(IncrementCounter());
  }

  bool isFavorite = false;
  void isFavoriteItem(ProductModel productModel) {
    isFavorite = !isFavorite;
    addToFavorite(productModel);
    emit(ChangeIsFavoriteState());
  }

  Future addToFavorite(ProductModel productModel) async {
    if (isFavorite) {
      localDatabase.insert(productModel: productModel);
      emit(AddToFavoriteState());
    } else {
      localDatabase.deleteData(id: productModel.id.toString());
      emit(DeleteFromFavoriteState());
    }
  }

  void decrementCounter() {
    if (counter > 0) {
      --counter;
      emit(DecrementCounter());
    }
  }

  void changeBottomNavigationCurrentIndex(int index) {
    bottomNavigationCurrentIndex = index;
    emit(ChangeBottomNavigationCurrentIndexState());
  }

  UserModel userModel = UserModel(name: '', image: '', email: '', token: '');
  Future getCurrentUser() async {
    var result = await homeRepository.getCurrentUserData();
    result.fold((l) {
      emit(GetUserDataErrorState(l));
    }, (r) {
      userModel = r;
      emit(GetUserData());
    });
  }

  List<OrderModel> orderList = [];
  Future getAllOrders() async {
    emit(GetUserOrdersLoadingState());
    var result = await homeRepository.getOrders();
    result.fold((l) {
      emit(GetUserOrdersErrorState());
    }, (r) {
      orderList = r;
      emit(GetUserOrdersSuccessState());
    });
  }

  Future addUserOrder(
      {required int quantity, required ProductModel productModel}) async {
    emit(AddUserOrderLoadingState());
    var result = await homeRepository.addOrder(
        productModel: productModel, quantity: quantity);
    result.fold((l) {
      emit(AddUserOrderErrorState());
    }, (r) {
      emit(AddUserOrderSuccessState());
    });
  }

  Future getImageGallery() async {
    try {
      homeRepository.getImageGallery().then((value) {
        homeRepository.uploadImage().then((value) {
          homeRepository.updateUserImage().then((value) async {
            await getCurrentUser();
          });
        });
      });
      emit(GetUserPictureSuccessState());
    } catch (error) {
      Print.white(error.toString());
      emit(GetUserPictureErrorState());
    }
  }
}
