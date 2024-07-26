part of 'teacher_account_bloc.dart';

@immutable
sealed class TeacherAccountState {}

final class TeacherAccountInitial extends TeacherAccountState {}
class GetTeacherAccountSuccessState extends  TeacherAccountState  {
  final TeacheraccountPreviousInfoModel teacherAccountPreviousModel;

 GetTeacherAccountSuccessState({required this.teacherAccountPreviousModel});
}
class GetTeacherAccountFailureState extends  TeacherAccountState {
  final String errorMessage;

 GetTeacherAccountFailureState({required this.errorMessage});
}
class GetTeacherAccountLoadingState extends  TeacherAccountState  {}
class TeacherEdittingState extends TeacherAccountState  {
  final newTeacherInfo;

 TeacherEdittingState ({required this.newTeacherInfo});
}