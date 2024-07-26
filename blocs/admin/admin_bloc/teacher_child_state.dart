part of 'teacher_child_bloc.dart';

@immutable
sealed class TeacherChildState {}

final class TeacherChildInitial extends TeacherChildState {}
// class AdminGetAllTeacherState extends TeacherChildState {
//   final List<A>
// }
class AdminGetAllChildsSucessState extends TeacherChildState {
  final List<AdminChildModel> childs;

  AdminGetAllChildsSucessState({required this.childs});
}

class AdminGetAllChildsFailureState extends TeacherChildState {
  final String errorMessage;

  AdminGetAllChildsFailureState({required this.errorMessage});
}
class AdminGetAllChildsLodingState extends TeacherChildState {}