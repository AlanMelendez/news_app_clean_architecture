import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app_clean_architecture/core/resources/data_state.dart';

import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';

import '../../domain/repository/article_repository.dart';
import '../data_sources/remote/new_api_service.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() async {
    try {
      final result = await _newsApiService.getNewsArticles(
        apiKey: '0551f9e096144a77b8d45b87a677d83f',
        country: 'us',
        category: 'general',
      );

      if (result.response.statusCode == HttpStatus.ok) {
        return DataSuccess(result.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: result.response.requestOptions,
            response: result.response,
            error: 'Failed to fetch news articles',
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
