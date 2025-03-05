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
        baseUrl: Variable.baseUrl, // Ganti dengan base URL API kamu
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 5),
      ),
    );

    // Tambahkan Interceptor untuk menyisipkan Token dan menangani error
    dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = AuthLocalDatasource.userData?.response?.token;
          if (token != null) {
            options.headers["Authorization"] = "Bearer $token";
          }
          options.headers["Content-Type"] = "application/json";
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          if (e.response?.statusCode == 401) {
            // Token expired, bisa refresh token di sini
          }
          return handler.next(e);
        },
      ),
      PrettyDioLogger(),
    ]);
  }

  // GET Request
  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      return await dio.get(path, queryParameters: queryParams);
    } catch (e) {
      throw Exception("GET Error: $e");
    }
  }

  // POST Request
  Future<Response> post(String path, {dynamic data}) async {
    try {
      return await dio.post(path, data: data);
    } catch (e) {
      throw Exception("POST Error: $e");
    }
  }

  // PUT Request
  Future<Response> put(String path, {dynamic data}) async {
    try {
      return await dio.put(path, data: data);
    } catch (e) {
      throw Exception("PUT Error: $e");
    }
  }

  // PATCH Request
  Future<Response> patch(String path, {dynamic data}) async {
    try {
      return await dio.patch(path, data: data);
    } catch (e) {
      throw Exception("PATCH Error: $e");
    }
  }

  // DELETE Request
  Future<Response> delete(String path) async {
    try {
      return await dio.delete(path);
    } catch (e) {
      throw Exception("DELETE Error: $e");
    }
  }
}
