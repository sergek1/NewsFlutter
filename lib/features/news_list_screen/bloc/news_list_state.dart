part of 'news_list_bloc.dart';

abstract class NewsListState extends Equatable {}

class NewsListInitial extends NewsListState {
  @override
  List<Object?> get props => [];
}

class NewsListLoading extends NewsListState {
  @override
  List<Object?> get props => [];
}

class NewsListLoadingFailure extends NewsListState {
  final Object? exception;

  NewsListLoadingFailure({this.exception});

  @override
  List<Object?> get props => [exception];
}

class NewsListLoaded extends NewsListState {
  NewsListLoaded({required this.newsList});

  final List<News> newsList;

  @override
  List<Object?> get props => [newsList];
}
