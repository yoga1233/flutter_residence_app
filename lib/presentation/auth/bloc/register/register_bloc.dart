import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_residence_app/data/datasource/auth_remote_datasource.dart';
import 'package:flutter_residence_app/data/model/request/register_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRemoteDatasource authRemoteDatasource;
  RegisterBloc(this.authRemoteDatasource) : super(_Initial()) {
    on<_Register>((event, emit) async {
      emit(_Loading());
      final result = await authRemoteDatasource.register(
        RegisterRequestModel(
          username: event.username,
          email: event.email,
          password: event.password,
        ),
      );
      result.fold((l) => emit(_Failed(l)), (r) => emit(_Success()));
    });
  }
}
