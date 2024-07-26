part of 'mother_login_bloc.dart';

@immutable
sealed class MotherLoginState {}

final class MotherLoginInitial extends MotherLoginState {}

class MotherLoginSuccessState extends MotherLoginState {
  final String token;

  MotherLoginSuccessState({required this.token});
}

class MotherLoginLoadingState extends MotherLoginState {}

class MotherLoginFailureState extends MotherLoginState {
  final String errorMessage;

  MotherLoginFailureState({required this.errorMessage});
}
