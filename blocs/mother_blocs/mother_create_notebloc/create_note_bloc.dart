import 'package:bloc/bloc.dart';
import 'package:flutter_childhood/model/mother_app_model/create_note_model.dart';
import 'package:flutter_childhood/service/mother_service/create_note_service.dart';
import 'package:meta/meta.dart';

part 'create_note_event.dart';
part 'create_note_state.dart';

class CreateNoteBloc extends Bloc<CreateNoteEvent, CreateNoteState> {
  MotherCreateNoteService motherCreateNoteService=MotherCreateNoteService();
  CreateNoteBloc() : super(CreateNoteInitial()) {
    on<MotherCreateNoteEvent>((event, emit)async {
      emit(MotherCreateNoteLoadingState());
      try{
        var result=await motherCreateNoteService.addChildNote(event.motherCreateNoteModel,event.childId);
        if (result is MotherCreateNoteModel){
          emit(MotherCreateNoteSuccessState(newchildnote: result));
        }
        else{
         emit(MotherCreateNoteFailureState(errorMessage: result)) ;
        }
      }
      catch(e){
        emit(MotherCreateNoteFailureState(errorMessage: e.toString()));
      }
    });
  }
}
