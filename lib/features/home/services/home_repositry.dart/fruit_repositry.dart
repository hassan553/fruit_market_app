import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class FruitRepository {
  Future<Either<String, DocumentSnapshot<Map<String, dynamic>>>>
      getOrganicFruitProducts() async {
    late dynamic value;
    try {
      await FirebaseFirestore.instance
          .collection('fruit')
          .doc('organic_fruit')
          .get()
          .then((v) {
        value = v;
      });
      return right(value);
    } catch (error) {
      return left(error.toString());
    }
  }

  Future<Either<String, DocumentSnapshot<Map<String, dynamic>>>>
      getMixedFruitProducts() async {
    late dynamic value;
    try {
      await FirebaseFirestore.instance
          .collection('fruit')
          .doc('mixed_fruit')
          .get()
          .then((v) {
        value = v;
      });
      return right(value);
    } catch (error) {
      print(error.toString());
      return left(error.toString());
    }
  }

  Future<Either<String, DocumentSnapshot<Map<String, dynamic>>>>
      getStoneFruitProducts() async {
    late dynamic value;
    try {
      await FirebaseFirestore.instance
          .collection('fruit')
          .doc('stone_fruit')
          .get()
          .then((v) {
        value = v;
      });
      return right(value);
    } catch (error) {
      return left(error.toString());
    }
  }

  Future<Either<String, DocumentSnapshot<Map<String, dynamic>>>>
      getMelonsFruitProducts() async {
    late dynamic value;
    try {
      await FirebaseFirestore.instance
          .collection('fruit')
          .doc('melons_fruit')
          .get()
          .then((v) {
        value = v;
      });
      return right(value);
    } catch (error) {
      return left(error.toString());
    }
  }
}
