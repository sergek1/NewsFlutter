part of 'news_details_bloc.dart';

abstract class NewsDetailsState extends Equatable {}

class NewsDetailsInitial extends NewsDetailsState {
  @override
  List<Object?> get props => [];
}

class NewsDetailsLoading extends NewsDetailsState {
  @override
  List<Object?> get props => [];
}

class NewsDetailsLoadingFailure extends NewsDetailsState {
  final Object? exception;

  NewsDetailsLoadingFailure({this.exception});

  @override
  List<Object?> get props => [exception];
}

class NewsDetailsLoaded extends NewsDetailsState {
  NewsDetailsLoaded({required this.newsDetails});

  final News newsDetails;

  @override
  List<Object?> get props => [newsDetails];
}
