import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutter/repositories/news/news.dart';

part 'news_details_event.dart';
part 'news_details_state.dart';

class NewsDetailsBloc extends Bloc<LoadNewsDetails, NewsDetailsState> {
  final AbstractNewsRepository newsRepository;
  NewsDetailsBloc(this.newsRepository) : super(NewsDetailsInitial()) {
    on<LoadNewsDetails>((event, emit) async {
      try {
        if (state is! NewsDetailsLoaded) {
          emit(NewsDetailsLoading());
        }
        final news = await newsRepository.getNewsDetails(event.id);
        emit(NewsDetailsLoaded(newsDetails: news));
      } catch (e) {
        emit(NewsDetailsLoadingFailure(exception: e));
      }
    });
  }
}
