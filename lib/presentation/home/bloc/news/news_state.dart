part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.initial() = _Initial;
  const factory NewsState.loading() = _Loading;
  const factory NewsState.success(NewsResponseModel data) = _Success;
  const factory NewsState.failed(String error) = _Failed;
}
