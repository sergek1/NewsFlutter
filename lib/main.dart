import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:news_flutter/repositories/news/news.dart';

import 'news_app.dart';

void main() {
  GetIt.I.registerSingleton(NewsRepository(dio: Dio()));
  runApp( const MyApp());
}
