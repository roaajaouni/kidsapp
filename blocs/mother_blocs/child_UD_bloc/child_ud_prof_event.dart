part of 'child_ud_prof_bloc.dart';

@immutable
sealed class ChildUdProfEvent {}
class DeleteChildEvent extends ChildUdProfEvent {
  final int childId;

  DeleteChildEvent({required this.childId});
}
class UpdateChildEvent extends ChildUdProfEvent {
  final int childId;
  final ChildInfoModel childInfoModel;

  UpdateChildEvent({required this.childId, required this.childInfoModel});
}
class GetChildPreviousInfoEvent extends ChildUdProfEvent {
  final int childId;

  GetChildPreviousInfoEvent({required this.childId});
}