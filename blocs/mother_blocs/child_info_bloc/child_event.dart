part of 'child_bloc.dart';

@immutable
sealed class ChildEvent {}
class AddNewChild extends ChildEvent{
  final ChildInfoModel childInfoModel;

  AddNewChild({required this.childInfoModel});
}
