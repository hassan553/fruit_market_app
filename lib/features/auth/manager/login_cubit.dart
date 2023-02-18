import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/features/auth/repository/login_repository.dart';
import 'package:print_color/print_color.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepository loginRepository;
  LoginCubit(this.loginRepository) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  Future userLogin(String email, String password) async {
    emit(LoginLoadingState());
    var result = await loginRepository.login(email, password);
    result.fold((l) {
      emit(LoginErrorState(l));
    }, (r) {
      emit(LoginSuccessState(r));
    });
  }
}
