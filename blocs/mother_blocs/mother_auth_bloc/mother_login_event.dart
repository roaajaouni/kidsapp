part of 'mother_login_bloc.dart';

@immutable
sealed class MotherLoginEvent {}
class AddMotherInfo extends MotherLoginEvent {
  final MotherLoginModel motherInfo;

  AddMotherInfo({required this.motherInfo});
}