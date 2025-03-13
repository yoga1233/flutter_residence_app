import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_residence_app/data/model/request/report_request_model.dart';

import '../../core/network/dio_client.dart';

class ReportRemoteDatasource {
  final dioClient = DioClient();
  Future<Either<String, bool>> createReport(ReportRequestModel data) async {
    FormData formData = FormData.fromMap({
      "title": data.title,
      "description": data.description,
      "image":
          data.image != null
              ? await MultipartFile.fromFile(
                data.image!.path,
                filename: "upload.jpg",
              )
              : null,
    });
    try {
      final response = await dioClient.post('/report', data: formData);
      if (response.statusCode == 200) {
        return right(true);
      } else {
        return left('Failed to create report');
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
