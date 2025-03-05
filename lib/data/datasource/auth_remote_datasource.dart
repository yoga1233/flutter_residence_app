import 'package:dartz/dartz.dart';
import 'package:flutter_residence_app/core/core.dart';
import 'package:flutter_residence_app/data/model/request/login_request_model.dart';
import 'package:flutter_residence_app/data/model/response/auth_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
    LoginRequestModel data,
  ) async {
    final response = await http.post(
      Uri.parse('${Variable.baseUrl}/auth/login'),

      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: data.toJson(),
    );
    if (response.statusCode == 200) {
      return right(AuthResponseModel.fromJson(response.body));
    } else {
      return left('Failed to login');
    }
  }
}
