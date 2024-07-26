part of 'viewreport_bloc.dart';

@immutable
sealed class ViewreportState {}

final class ViewreportInitial extends ViewreportState {}
class GetAllMyKidsReportsSuccessState extends ViewreportState {
final List<ViewReportModel>reportMyKids;

  GetAllMyKidsReportsSuccessState({required this.reportMyKids});
}
class GetAllMyKidsReportsFailureState extends ViewreportState {
  final String errorMessage;

  GetAllMyKidsReportsFailureState({required this.errorMessage});
}
class GetAllMyKidsReportsLoadingState extends ViewreportState {}
class MyKidsReportNoAddedState extends ViewreportState {}