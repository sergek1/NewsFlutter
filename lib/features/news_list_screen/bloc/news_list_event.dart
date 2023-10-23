part of 'news_list_bloc.dart';

abstract class NewsListEvent extends Equatable {}

class LoadNewsList extends NewsListEvent {
  final Completer? completer;

  LoadNewsList({this.completer});

  @override
  List<Object?> get props => [completer];
}
