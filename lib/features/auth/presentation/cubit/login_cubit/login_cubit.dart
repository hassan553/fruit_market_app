import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/features/auth/data/repository/login_repository.dart';

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
