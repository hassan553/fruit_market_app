import 'package:get/get.dart';

import '../model/collection_model.dart';
import '../model/product_model.dart';
import '../services/home_repositry.dart/fruit_repositry.dart';

class Controller extends GetxController {
  List<ProductModel> mixedFruitList = [];
  CollectionModel? collectionModel;
  bool isLoading = true;
  Future fetchMixedFruitProducts() async {
    isLoading = true;
    var result = await FruitRepository().getOrganicFruitProducts();
    result.fold((error) {
      print(error);
      isLoading = false;
    }, (value) {
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
            isLoading = false;

    });
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
        fetchMixedFruitProducts();

  }
}
