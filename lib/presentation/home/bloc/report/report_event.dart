part of 'report_bloc.dart';

@freezed
class ReportEvent with _$ReportEvent {
  const factory ReportEvent.started() = _Started;
  const factory ReportEvent.sendReport(ReportRequestModel data) = _SendReport;
}
