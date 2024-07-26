part of 'create_note_bloc.dart';

@immutable
sealed class CreateNoteEvent {}
class MotherCreateNoteEvent extends CreateNoteEvent {
final MotherCreateNoteModel  motherCreateNoteModel;
final int childId;
  MotherCreateNoteEvent(  {required this.childId,required this.motherCreateNoteModel});


}
