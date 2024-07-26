// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'teacher_admin_bloc.dart';

@immutable
sealed class TeacherAdminState {}

 class TeacherAdminInitial extends TeacherAdminState {

}

 class TeacherAdminLoading extends TeacherAdminState {

}

class TeacherAdminSuccess extends TeacherAdminState {
  final List<AdminTeacherModel> teachers ;
  TeacherAdminSuccess({
    required this.teachers,
  });

}

class TeacherAdminFailure extends TeacherAdminState {
  final String errorMessage;
  TeacherAdminFailure({
    required this.errorMessage,
  });


}


