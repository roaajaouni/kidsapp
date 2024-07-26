import 'package:bloc/bloc.dart';
import 'package:flutter_childhood/model/teacher_app_model/read_note.dart';
import 'package:flutter_childhood/service/teacher_service/read_note_service.dart';
import 'package:meta/meta.dart';

part 'read_note_event.dart';
part 'read_note_state.dart';

class ReadNoteBloc extends Bloc<ReadNoteEvent, ReadNoteState> {
   TeacherReadNoteService teacherReadNoteService= TeacherReadNoteService();
  ReadNoteBloc() : super(ReadNoteInitial()) {
    on<TeacherReadNoteEvent>((event, emit)async {
      emit(TeacherReadNoteLoadingState());
      try{
var teacherNoteMap=await  teacherReadNoteService.getTeacherKidsNotes(event.childId);
//List<TeacherReadNoteModel> teacherNoteModel=List.generate( teacherNoteMap.length, (index) =>TeacherReadNoteModel.fromMap( teacherNoteMap[index]) );
TeacherReadNoteModel teacherNoteModel=TeacherReadNoteModel.fromMap( teacherNoteMap);
// emit(TeacherReadNoteSuccessState(teacherReadNoteModel:teacherNoteModel ));
 if (teacherNoteModel==null) {
          emit( TeacherNoAddedNoteState());
        } else {
          emit(TeacherReadNoteSuccessState(teacherReadNoteModel: teacherNoteModel));
        }
      }
      catch(e){
emit(TeacherReadNoteFailureState(errorMessage: e.toString()));
      }
    });
  }
}
