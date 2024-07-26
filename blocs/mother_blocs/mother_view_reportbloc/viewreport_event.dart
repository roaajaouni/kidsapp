part of 'viewreport_bloc.dart';

@immutable
sealed class ViewreportEvent {}
class GetAllMyKidsReportsEvent extends ViewreportEvent {
  final int childId;

  GetAllMyKidsReportsEvent({required this.childId});
}