part of 'create_note_bloc.dart';

@immutable
sealed class CreateNoteState {}

final class CreateNoteInitial extends CreateNoteState {}
class MotherCreateNoteSuccessState extends CreateNoteState {
final MotherCreateNoteModel newchildnote;

  MotherCreateNoteSuccessState({required this.newchildnote});
}
class MotherCreateNoteLoadingState extends CreateNoteState {

}
class MotherCreateNoteFailureState extends CreateNoteState {
  final String errorMessage;

  MotherCreateNoteFailureState({required this.errorMessage});
}