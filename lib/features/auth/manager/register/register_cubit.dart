import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/otp_repository.dart';
import '../../repository/register_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepository, this.otpRepository)
      : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  RegisterRepository registerRepository;
  OTPRepository otpRepository;

  Future userRegister({
    required String email,
    required String password,
    required String name,
    String image = '',
  }) async {
    emit(RegisterLoadingState());
    var result = await registerRepository.register(
      email: email,
      password: password,
      name: name,
    );
    result.fold((l) {
      emit(RegisterErrorState(l));
    }, (r) {
      emit(RegisterSuccessState(r));
    });
  }

  Future sendEmailVerification() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  Future checkEmailVerification() async {
    emit(EmailVerifiedLoadingState());
    if (FirebaseAuth.instance.currentUser!.emailVerified) {
      emit(EmailVerifiedSuccessState());
    }
  }
}
