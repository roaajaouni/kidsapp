part of 'read_note_bloc.dart';

@immutable
sealed class ReadNoteEvent {}
class TeacherReadNoteEvent extends ReadNoteEvent {
  final int childId;

  TeacherReadNoteEvent({required this.childId});
}