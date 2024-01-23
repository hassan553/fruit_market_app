import 'package:dartz/dartz.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:print_color/print_color.dart';

class OTPRepository {
  EmailAuth emailAuth = EmailAuth(sessionName: "Sample session");
  Future<Either<String, bool>> sendOtp(String email) async {
    try {
      bool result = await emailAuth.sendOtp(
        recipientMail: email,
        otpLength: 4,
      );
      return right(result);
    } catch (error) {
      return left(error.toString());
    }
  }

  Either<String, bool> checkValidation(String email, String code) {
    try {
      bool result = emailAuth.validateOtp(recipientMail: email, userOtp: code);
      return right(result);
    } catch (error) {
      return left(error.toString());
    }
  }

  void sendEmailVerification() async {
    await FirebaseAuth.instance.currentUser?.sendEmailVerification();
  }

  void resendEmailVerification() async {
    await FirebaseAuth.instance.currentUser?.reload();
  }

  Future<bool> checkEmailVerification() async {
    bool isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    Print.green(isEmailVerified);
    return isEmailVerified;
  }
}
