import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news_flutter/repositories/news/news.dart';

import '../bloc/news_details_bloc.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({
    super.key,
    required this.id,
    required this.appBarTitle,
  });

  final String id;
  final String appBarTitle;

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  void initState() {
    _newsDetailsBloc.add(LoadNewsDetails(widget.id));
    super.initState();
  }

  final _newsDetailsBloc = NewsDetailsBloc(GetIt.instance<NewsRepository>());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(80, 80, 80, 1),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/news_list');
          },
        ),
        title: Text(
          widget.appBarTitle,
          style: theme.textTheme.headlineMedium,
        ),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
      ),
      body: BlocBuilder<NewsDetailsBloc, NewsDetailsState>(
        bloc: _newsDetailsBloc,
        builder: (context, state) {
          if (state is NewsDetailsLoaded) {
            return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.newsDetails.date,
                      style: theme.textTheme.labelSmall,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Image.network(state.newsDetails.image),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      state.newsDetails.name,
                      style: theme.textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(state.newsDetails.description ?? "",
                        style: theme.textTheme.bodyMedium),
                  ],
                ));
          }
          if (state is NewsDetailsLoadingFailure) {
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
                      _newsDetailsBloc.add(LoadNewsDetails(widget.id));
                    },
                    child: const Text('Try again'))
              ],
            ));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
