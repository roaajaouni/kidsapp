import 'package:bloc/bloc.dart';
import 'package:flutter_childhood/model/mother_app_model/child_info_model.dart';
import 'package:flutter_childhood/service/mother_service/child_service.dart';
import 'package:meta/meta.dart';

part 'child_event.dart';
part 'child_state.dart';

class ChildBloc extends Bloc<ChildEvent, ChildState> {
  ChildService childService = ChildService();
  ChildBloc() : super(ChildInitial()) {
    on<AddNewChild>((event, emit) async {
      emit(ChildLoadingState());
      try {
        var result = await childService.addChildInfo(event.childInfoModel);
        if (result is ChildInfoModel) {
          // print("success");
          emit(ChildAddedState(newChildInfo: result));
        } else {
          // print("failure");
          emit(
            ChildFailuerState(
              errorMessage: result,
            ),
          );
        }
      } catch (e) {
        emit(ChildFailuerState(errorMessage: e.toString()));
      }
    });
  }
}
