import 'dart:async';

import 'package:news_flutter/features/news_list_screen/bloc/news_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../repositories/news/news.dart';
import '../widgets/widgets.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key, required this.title});

  final String title;

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  final _newsListBloc = NewsListBloc(GetIt.instance<NewsRepository>());

  @override
  void initState() {
    _newsListBloc.add(LoadNewsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/user.png'),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/account_screen');
          },
        ),
        title: Text(
          widget.title,
          style: theme.textTheme.headlineMedium,
        ),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _newsListBloc.add(LoadNewsList(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<NewsListBloc, NewsListState>(
          bloc: _newsListBloc,
          builder: (context, state) {
            if (state is NewsListLoaded) {
              return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.newsList.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, i) {
                    final news = state.newsList[i];
                    return NewsItem(news: news);
                  });
            }
            if (state is NewsListLoadingFailure) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Something went wrong.',
                    style: theme.textTheme.headlineMedium,
                  ),
                  Text(
                    'Please try again later.',
                    style: theme.textTheme.labelSmall?.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                      onPressed: () {
                        _newsListBloc.add(LoadNewsList());
                      },
                      child: const Text('Try again'))
                ],
              ));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
