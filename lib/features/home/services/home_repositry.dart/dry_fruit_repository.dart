import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class DryFruitsRepository {
  Future<Either<String, DocumentSnapshot<Map<String, dynamic>>>>
      getIndehiscentDryProducts() async {
    late dynamic value;
    try {
      await FirebaseFirestore.instance
          .collection('dry_fruits')
          .doc('indehiscent_dry')
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
          .collection('dry_fruits')
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
      getDehiscentDryProducts() async {
    late dynamic value;
    try {
      await FirebaseFirestore.instance
          .collection('dry_fruits')
          .doc('dehiscent_fruits')
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
      getKashmiriDryFruitProducts() async {
    late dynamic value;
    try {
      await FirebaseFirestore.instance
          .collection('dry_fruits')
          .doc('kashmiri_dry')
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
