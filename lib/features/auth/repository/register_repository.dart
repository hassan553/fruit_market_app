import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/constants/constants.dart';
import '../model/user_model.dart';

class RegisterRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<Either<String, UserCredential>> register({
    required String email,
    required String password,
    required String name,
    String image = '',
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      UserModel userModel = UserModel(
          name: name, image: image, email: email, token: _auth.currentUser!.uid);

      await FirebaseFirestore.instance
          .collection('users').doc(_auth.currentUser!.uid)
          .set(userModel.toMap());
      return right(result);
    } catch (error) {
      return left('Oops an Error');
    }
  }
}
