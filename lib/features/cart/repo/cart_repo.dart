import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fruit_market_app/features/home/model/product_model.dart';

import '../../../core/constants/constants.dart';

class CartRepository {
  Future<Either<String, bool>> addToCart(ProductModel productModel) async {
    try {

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('cart')
          .add(productModel.toJson());
      return right(true);
    } catch (error) {
      return left(error.toString());
    }
  }

  Future<Either<String, List<ProductModel>>> getFromCart() async {
    List<ProductModel> productModelList = [];
    try {
      QuerySnapshot<Map<String, dynamic>> result =
          
          await FirebaseFirestore
          .instance
          .collection('users')
          .doc(userId)
          .collection('cart')
          .get();
      result.docs.map((e) {
        productModelList.add(ProductModel.fromJson(e.data()));
      });
      return right(productModelList);
    } catch (error) {
      return left(error.toString());
    }
  }
  Future<Either<String, bool>> removeFromCart(int productID) async {
    List<ProductModel> productModelList = [];
    try {
     
          await FirebaseFirestore.instance.collection('users').doc(userId).collection('cart');
      
      return right(true);
    } catch (error) {
      return left(error.toString());
    }
  }
}
