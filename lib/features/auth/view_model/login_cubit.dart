import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/features/auth/model/user_model.dart';
import 'package:fruit_market_app/features/auth/repositry/firebase/firebase_repositry.dart';
import 'package:fruit_market_app/main.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var focusNode = FocusNode();
  Future signInWithFacebook() async {
    emit(LoginWithFacebookLoadingState());

    try {
      await FirebaseRepository.signInWithFacebook();
      emit(LoginWithFacebookSuccessState());
    } catch (e) {
      emit(LoginWithFacebookErrorState(e.toString()));
    }
  }

  Future signInWithGoogle() async {
    emit(LoginWithGoogleLoadingState());
    try {
      UserCredential? user = await FirebaseRepository.signInWithGoogle();
      emit(LoginWithGoogleSuccessState(user.credential?.token));
    } catch (e) {
      emit(LoginWithGoogleErrorState(e.toString()));
    }
  }

  compeletUserInfo({
    required String name,
    required String address,
    required String phone,
  }) async {
    emit(LoginCompleteUserInfoLoadingState());
    try {
      String token = sharedPreferences.getString('token') ?? '';
      UserModel userModel = UserModel(
        name: name,
        address: address,
        phone: phone,
        token: token,
      );

      await FirebaseFirestore.instance
          .collection('users').doc(token)
          .set(userModel.toMap());
      emit(LoginCompleteUserInfoSuccessState());
    } catch (error) {
      emit(LoginCompleteUserInfoErrorState(error.toString()));
    }
  }
}
