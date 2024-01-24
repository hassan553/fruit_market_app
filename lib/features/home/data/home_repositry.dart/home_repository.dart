import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'package:fruit_market_app/features/auth/data/model/user_model.dart';
import 'package:fruit_market_app/features/home/data/model/order_model.dart';
import 'package:image_picker/image_picker.dart';

import '../model/product_model.dart';

class HomeRepository {
  final String _userId = FirebaseAuth.instance.currentUser!.uid;
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;
  File? profileImage;
  var pickerGallery = ImagePicker();
  String url = '';
  Future<Either<String, UserModel>> getCurrentUserData() async {
    try {
      var response =
          await _firebaseFireStore.collection('users').doc(_userId).get();
      var userModel = UserModel.fromJson(response.data()!);
      return right(userModel);
    } catch (error) {
      return left(error.toString());
    }
  }

  Future<Either<String, bool>> addOrder(
      {required int quantity, required ProductModel productModel}) async {
    try {
      var response = await _firebaseFireStore
          .collection('users')
          .doc(_userId)
          .collection('orders')
          .add(productModel.toJson());
      return right(true);
    } catch (error) {
      return left(error.toString());
    }
  }

  Future<Either<String, List<OrderModel>>> getOrders() async {
    try {
      List<OrderModel> ordersList = [];
      QuerySnapshot<Map<String, dynamic>> response = await _firebaseFireStore
          .collection('users')
          .doc(_userId)
          .collection('orders')
          .get();
      for (var element in response.docs) {
        ordersList.add(OrderModel.fromJson(element.data()));
      }
      return right(ordersList);
    } catch (error) {
      return left(error.toString());
    }
  }

  Future getImageGallery() async {
    try {
      var pickerImageGallery = await pickerGallery.pickImage(
        source: ImageSource.gallery,
      );
      if (pickerImageGallery != null) {
        profileImage = File(pickerImageGallery.path);
        await uploadImage();
      }
    } catch (error) {}
  }

  Future uploadImage() async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('userImages')
          .child('$_userId.jpg');
      await ref.putFile(profileImage!);
      url = await ref.getDownloadURL();
    } catch (error) {}
  }

  Future updateUserImage() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_userId)
        .update({'image': url}).then((value) {});
  }
}
