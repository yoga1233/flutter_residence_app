// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_residence_app/data/datasource/report_remote_datasource.dart';
import 'package:flutter_residence_app/data/model/request/report_request_model.dart';

part 'report_bloc.freezed.dart';
part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportRemoteDatasource reportRemoteDatasource;
  ReportBloc(this.reportRemoteDatasource) : super(_Initial()) {
    on<_SendReport>((event, emit) async {
      emit(_Loading());
      final result = await reportRemoteDatasource.createReport(event.data);
      result.fold((l) => emit(_Failed(l)), (r) => emit(_Success()));
    });
  }
}
