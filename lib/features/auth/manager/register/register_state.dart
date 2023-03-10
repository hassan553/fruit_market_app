part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final UserCredential user;
  const RegisterSuccessState(this.user);
}

class RegisterErrorState extends RegisterState {
  final String error;
  const RegisterErrorState(this.error);
}

class EmailVerifiedSuccessState extends RegisterState {}
class EmailVerifiedErrorState extends RegisterState {}

class EmailVerifiedLoadingState extends RegisterState {}
