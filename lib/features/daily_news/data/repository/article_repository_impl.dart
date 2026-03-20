import 'package:news_app_clean_architecture/core/resources/data_state.dart';

import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';

import '../../domain/repository/article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() {
    // TODO: implement getNewsArticles
    throw UnimplementedError();
  }
 



}