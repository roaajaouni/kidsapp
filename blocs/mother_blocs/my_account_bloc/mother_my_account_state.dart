part of 'mother_my_account_bloc.dart';

@immutable
sealed class MotherMyAccountState {}

final class MotherMyAccountInitial extends MotherMyAccountState {}
class GetMotherAccountSuccessState extends MotherMyAccountState {
  final MotherMyAccountModel motherMyAccountModel;

  GetMotherAccountSuccessState({required this.motherMyAccountModel});
}
class GetMotherAccountFailureState extends MotherMyAccountState {
  final String errorMessage;

  GetMotherAccountFailureState({required this.errorMessage});
}
class GetMotherAccountLoadingState extends MotherMyAccountState {}
class MotherEdittingState extends MotherMyAccountState {
  final MotherMyAccountModel newMotherInfo;

  MotherEdittingState({required this.newMotherInfo});
}