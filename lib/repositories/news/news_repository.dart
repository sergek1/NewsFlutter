import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'abstract_news_repository.dart';
import 'models/news.dart';

class NewsRepository implements AbstractNewsRepository {
  final Dio dio;

  NewsRepository({required this.dio});

  @override
  Future<List<News>> getNewsList() async {
    final response = await dio.get('https://webstripe.ru/list.json');
    List<dynamic> data = response.data['news'];
    List<News> newsList = data
        .map((news) => News(
              id: news['id'],
              name: news['name'],
              image: news['image'],
              date: news['date'],
              description: news['description'],
            ))
        .toList();
    return newsList;
  }

  @override
  Future<News> getNewsDetails(String id) async {
    final newsList = await getNewsList();
    final news = newsList.firstWhere((element) => element.id == id);
    return news;
  }
}
