import 'package:bloc/bloc.dart';
import 'package:flutter_residence_app/data/datasource/auth_remote_datasource.dart';
import 'package:flutter_residence_app/data/model/request/login_request_model.dart';
import 'package:flutter_residence_app/data/model/response/auth_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRemoteDatasource authRemoteDatasource;
  LoginBloc(this.authRemoteDatasource) : super(_Initial()) {
    on<_Login>((event, emit) async {
      emit(_Loading());
      final result = await authRemoteDatasource.login(
        LoginRequestModel(event.email, event.password),
      );
      result.fold(
        (error) => emit(_Failed(error)),
        (data) => emit(_Success(data)),
      );
    });
  }
}
