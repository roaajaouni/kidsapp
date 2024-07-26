part of 'mother_my_account_bloc.dart';

@immutable
sealed class MotherMyAccountEvent {}
class GetMotherEvent extends MotherMyAccountEvent {
  //final int motherId;
// final String token;

}

  



class SendMotherInfoEdittingEvent extends MotherMyAccountEvent {
  final  UpdateMotherInfoModel updateMotherInfoModel;

  SendMotherInfoEdittingEvent({required this.updateMotherInfoModel});
}