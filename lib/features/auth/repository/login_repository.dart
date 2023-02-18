import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<Either<String, UserCredential>> login(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return right(result);
    } catch (error) {
      return left('Oops an Error');
    }
  }
}
