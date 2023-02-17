part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginWithGoogleLoadingState extends LoginState {}

class LoginWithGoogleSuccessState extends LoginState {
  int? token;
  LoginWithGoogleSuccessState(this.token);
}

class LoginWithGoogleErrorState extends LoginState {
  final String error;
  LoginWithGoogleErrorState(this.error);
}

class LoginWithFacebookLoadingState extends LoginState {}

class LoginWithFacebookSuccessState extends LoginState {}

class LoginWithFacebookErrorState extends LoginState {
  final String error;
  LoginWithFacebookErrorState(this.error);
}

class LoginCompleteUserInfoLoadingState extends LoginState {}

class LoginCompleteUserInfoSuccessState extends LoginState {}

class LoginCompleteUserInfoErrorState extends LoginState {
  final String error;
  LoginCompleteUserInfoErrorState(this.error);
}
