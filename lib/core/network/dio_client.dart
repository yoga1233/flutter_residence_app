import 'package:dio/dio.dart';
import 'package:flutter_residence_app/core/constant/constant.dart';
import 'package:flutter_residence_app/data/datasource/auth_local_datasource.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;

  late Dio dio;

  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: Variable.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 5),
        headers: {"Content-Type": "application/json"},
      ),
    );

    dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = AuthLocalDatasource.userData?.response?.token;
          if (token != null) {
            options.headers["Authorization"] = "Bearer $token";
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (e, handler) {
          String errorMessage =
              e.response?.data["metadata"]["message"] ?? "Unauthorized";
          if (errorMessage.contains('Unauthorized')) {
            // Coba refresh token

            throw Exception("Session expired");
          }

          return handler.next(e);
        },
      ),
      PrettyDioLogger(),
    ]);
  }

  /// GET Request
  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      return await dio.get(path, queryParameters: queryParams);
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  /// POST Request
  Future<Response> post(String path, {dynamic data}) async {
    try {
      return await dio.post(path, data: data);
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  /// PUT Request
  Future<Response> put(String path, {dynamic data}) async {
    try {
      return await dio.put(path, data: data);
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  /// PATCH Request
  Future<Response> patch(String path, {dynamic data}) async {
    try {
      return await dio.patch(path, data: data);
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  /// DELETE Request
  Future<Response> delete(String path) async {
    try {
      return await dio.delete(path);
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  /// Handler untuk menangani error dari DioException
  Response _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        throw "Connection timeout, please try again later.";
      case DioExceptionType.receiveTimeout:
        throw "Server is not responding, please try again.";
      case DioExceptionType.badResponse:
        if (e.response?.statusCode == 401) {
          String errorMessage =
              e.response?.data["metadata"]["message"] ?? "Unauthorized access.";
          throw errorMessage;
        }
        throw "Server error: ${e.response?.statusCode}";
      case DioExceptionType.cancel:
        throw "Request has been canceled.";
      default:
        throw "An unexpected error occurred: ${e.message}";
    }
  }
}
