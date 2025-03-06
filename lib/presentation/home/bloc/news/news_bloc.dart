// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_residence_app/data/datasource/news_remote_datasource.dart';
import 'package:flutter_residence_app/data/model/response/news_response_model.dart';

part 'news_bloc.freezed.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRemoteDatasource newsRemoteDatasource;
  NewsBloc(this.newsRemoteDatasource) : super(_Initial()) {
    on<_GetNews>((event, emit) async {
      emit(_Loading());
      final result = await newsRemoteDatasource.getNews();

      result.fold(
        (data) => emit(_Failed(data)),
        (data) => emit(_Success(data)),
      );
    });
  }
}
