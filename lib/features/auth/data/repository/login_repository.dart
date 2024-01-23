import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_market_app/core/services/services_lecator.dart';

class LoginRepository {
  Future<Either<String, UserCredential>> login(
      String email, String password) async {
    try {
      UserCredential result = await gitIt<FirebaseAuth>().signInWithEmailAndPassword(
          email: email, password: password);
      return right(result);
    } catch (error) {
      return left(error.toString());
    }
  }
}
