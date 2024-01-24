import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class DryFruitsRepository {
  Future<Either<String, DocumentSnapshot<Map<String, dynamic>>>>
      getIndehiscentDryProducts() async {
    late dynamic value;
    try {
      await FirebaseFirestore.instance
          .collection('dry_fruit')
          .doc('indehiscent')
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
      getDehiscentDryProducts() async {
    late dynamic value;
    try {
      await FirebaseFirestore.instance
          .collection('dry_fruit')
          .doc('dehiscent')
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
      getMixedDryProducts() async {
    late dynamic value;
    try {
      await FirebaseFirestore.instance
          .collection('dry_fruit')
          .doc('mixed_dry')
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
      getKashmiriDryFruitProducts() async {
    late dynamic value;
    try {
      await FirebaseFirestore.instance
          .collection('dry_fruit')
          .doc('kashmiri')
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
