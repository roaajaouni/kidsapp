part of 'read_note_bloc.dart';

@immutable
sealed class ReadNoteState {}

final class ReadNoteInitial extends ReadNoteState {}
class TeacherReadNoteSuccessState extends ReadNoteState {
  final  TeacherReadNoteModel teacherReadNoteModel;

  TeacherReadNoteSuccessState({required this.teacherReadNoteModel});
}
class TeacherReadNoteFailureState extends ReadNoteState {
  final String errorMessage;

  TeacherReadNoteFailureState({required this.errorMessage});
}
class TeacherReadNoteLoadingState extends ReadNoteState {}
class TeacherNoAddedNoteState extends ReadNoteState {}