import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_residence_app/core/network/dio_client.dart';
import 'package:flutter_residence_app/data/model/request/login_request_model.dart';
import 'package:flutter_residence_app/data/model/request/register_request_model.dart';
import 'package:flutter_residence_app/data/model/response/auth_response_model.dart';

class AuthRemoteDatasource {
  final dioClient = DioClient();

  Future<Either<String, AuthResponseModel>> login(
    LoginRequestModel data,
  ) async {
    try {
      final response = await dioClient.post('/auth/login', data: data.toJson());

      if (response.statusCode == 200) {
        return right(AuthResponseModel.fromJson(jsonEncode(response.data)));
      } else {
        return left('Failed to login');
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, bool>> register(RegisterRequestModel data) async {
    final response = await dioClient.post(
      '/auth/register',
      data: data.toJson(),
    );

    if (response.statusCode == 200) {
      return right(true);
    } else {
      return left('Failed to register');
    }
  }
}
