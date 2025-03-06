import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_residence_app/core/network/dio_client.dart';
import 'package:flutter_residence_app/data/model/response/news_response_model.dart';

class NewsRemoteDatasource {
  final dioClient = DioClient();

  Future<Either<String, NewsResponseModel>> getNews() async {
    final response = await dioClient.get('/news');

    if (response.statusCode == 200) {
      return right(NewsResponseModel.fromJson(jsonEncode(response.data)));
    } else {
      return left('Enable to load news data');
    }
  }
}
