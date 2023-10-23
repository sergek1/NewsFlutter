import 'models/news.dart';

abstract class AbstractNewsRepository {
  Future<List<News>> getNewsList();
  Future<News> getNewsDetails(String id);
}