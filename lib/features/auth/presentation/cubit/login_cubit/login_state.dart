part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final UserCredential user;
  const LoginSuccessState(this.user);
}

class LoginErrorState extends LoginState {
  final String error;
  const LoginErrorState(this.error);
}
