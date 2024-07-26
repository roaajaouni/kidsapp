part of 'child_ud_prof_bloc.dart';

@immutable
sealed class ChildUdProfState {}

final class ChildUdProfInitial extends ChildUdProfState {}
class ChildIsDeletedState extends ChildUdProfState {
  final String deleteIsSuccess;

  ChildIsDeletedState({required this.deleteIsSuccess});
}
class ChildDeletedFailureState extends ChildUdProfState {
  final String errorMessage;

  ChildDeletedFailureState({required this.errorMessage});
}
class ChildUpdatedIsSuccess extends ChildUdProfState {
  final ChildInfoModel newChildInfo;

  ChildUpdatedIsSuccess({required this.newChildInfo});
}
class ChildUpdatedFailureState extends ChildUdProfState {
  final String errorMessage;

  ChildUpdatedFailureState({required this.errorMessage});
}
class GetChildPreviousInfoState extends ChildUdProfState {
  final ChildInfoModel childInfo;

  GetChildPreviousInfoState({required this.childInfo});
}