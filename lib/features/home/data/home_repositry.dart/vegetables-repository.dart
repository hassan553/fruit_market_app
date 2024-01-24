import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class VegetablesRepository {
  Future<Either<String, DocumentSnapshot<Map<String, dynamic>>>>
      getOrganicVegetablesProducts() async {
    late dynamic value;
    try {
      await FirebaseFirestore.instance
          .collection('vegetables')
          .doc('organic_vegetables')
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
      getMixedVegetablesProducts() async {
    late dynamic value;
    try {
      await FirebaseFirestore.instance
          .collection('vegetables')
          .doc('mixed_vegetables')
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
      getRootVegetablesProducts() async {
    late dynamic value;
    try {
      await FirebaseFirestore.instance
          .collection('vegetables')
          .doc('root_vegetables')
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
      getAlliumVegetablesProducts() async {
    late dynamic value;
    try {
      await FirebaseFirestore.instance
          .collection('vegetables')
          .doc('allium_vegetables')
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
