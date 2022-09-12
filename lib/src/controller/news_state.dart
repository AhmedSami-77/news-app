part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}
class NewsChangeBottomSheet extends NewsState {}
class NewsLoadingGetBusiness extends NewsState {}

class NewsGetBusinessSuccess extends NewsState {}
class NewsGetBusinessError extends NewsState {
  final String error;
  NewsGetBusinessError(this.error);
}
class NewsLoadingGetSports extends NewsState {}
class NewsGetSportsSuccess extends NewsState {}
class NewsGetSportsError extends NewsState {
  final String error;
  NewsGetSportsError(this.error);
}
class NewsLoadingGetScience extends NewsState {}
class NewsGetScienceSuccess extends NewsState {}
class NewsGetScienceError extends NewsState {
  final String error;
  NewsGetScienceError(this.error);
}
