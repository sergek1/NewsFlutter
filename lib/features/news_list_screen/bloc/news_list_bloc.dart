import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutter/repositories/news/news.dart';

part 'news_list_event.dart';

part 'news_list_state.dart';

class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  NewsListBloc(this.newsRepository) : super(NewsListInitial()) {
    on<LoadNewsList>((event, emit) async {
      try {
        if (state is! NewsListLoaded) {
          emit(NewsListLoading());
        }
        final newsList = await newsRepository.getNewsList();
        emit(NewsListLoaded(newsList: newsList));
      } catch (e) {
        emit(NewsListLoadingFailure(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
  }

  final AbstractNewsRepository newsRepository;
}
