part of 'signup_mother_bloc.dart';

@immutable
sealed class SignupMotherEvent {}
class AddMotherSignupInfo extends  SignupMotherEvent{
  final MotherSignupModel motherSignUpModel;

  AddMotherSignupInfo({required this.motherSignUpModel});
}