part of 'signup_mother_bloc.dart';

@immutable
sealed class SignupMotherState {}

final class SignupMotherInitial extends SignupMotherState {}
class MotherSignUpSuccessState extends SignupMotherState {
  final String successmessage;

  MotherSignUpSuccessState({required this.successmessage});
}
class MotherSignUpFailureState  extends SignupMotherState {
  final String errormessage;

  MotherSignUpFailureState({required this.errormessage});
}
class MotherSignUpLoading extends SignupMotherState {}