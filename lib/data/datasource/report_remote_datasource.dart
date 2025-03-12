import 'package:dartz/dartz.dart';
import 'package:flutter_residence_app/data/model/request/report_request_model.dart';

import '../../core/network/dio_client.dart';

class ReportRemoteDatasource {
  final dioClient = DioClient();
  Future<Either<String, bool>> createReport(ReportRequestModel data) async {
    try {
      final response = await dioClient.post('/report', data: data.toJson());
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
