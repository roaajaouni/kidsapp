// import 'package:bloc/bloc.dart';
// import 'package:flutter_childhood/model/notifications_model.dart';

// import 'package:flutter_childhood/service/mother_service/notifications_service.dart';
// import 'package:meta/meta.dart';

// part 'notification_mother_event.dart';
// part 'notification_mother_state.dart';

// class NotificationMotherBloc extends Bloc<NotificationMotherEvent, NotificationMotherState> {
//   NotificationService notificationService=NotificationService();
//   NotificationMotherBloc(NotificationService notificationService) : super(NotificationMotherInitial()) {
//     on<FetchNotificationsEvent>((event, emit)async {
//       emit(NotificationLoading());

//       try {
//         var notificationsMap = await notificationService.fetchNotifications();
//         List<NotificationsModel> notificationsModel = List.generate( notificationsMap.length, (index) =>NotificationsModel.fromMap(notificationsMap[index]) );

//         emit(NotificationLoaded(notificationsModel));
//       } catch (e) {
//         emit(NotificationErrorState(e.toString()));
//       }
//     });
//   }
// }
