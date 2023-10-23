import 'package:flutter/material.dart';

import '../../../repositories/news/models/news.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacementNamed(
            '/news_details',
            arguments: ["2", "ЭВОЛЮЦИЯ SEO: АДАПТАЦИЯ К ИЗМЕНЕНИЯМ"],
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.date,
              style: theme.textTheme.labelSmall,
            ),
            const SizedBox(
              height: 8,
            ),
            Image.network(news.image),
            const SizedBox(
              height: 8,
            ),
            Text(
              news.name,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ));
  }
}
