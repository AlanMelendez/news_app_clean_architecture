import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/remote/remote_article_bloc.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/remote/remote_article_state.dart';

class DailyNews extends StatefulWidget {
  const DailyNews({super.key});

  @override
  State<DailyNews> createState() => _DailyNewsState();
}

class _DailyNewsState extends State<DailyNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Daily News'))),
      body: _buildBody(),
    );
  }
}

BlocBuilder<RemoteArticleBloc, RemoteArticleState> _buildBody() {
  return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
    builder: (_, state) {
      if (state is RemoteArticlesLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is RemoteArticlesDone) {
        final articles = state.articles!;
        return Expanded(child: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final article = articles[index];
            return ListTile(
              title: Text(article.title!),
              subtitle: Text(article.description ?? ''),
            );
          },
        ));
      }

      return SizedBox();
    },
  );
}
