
import 'package:news_app_clean_architecture/features/daily_news/data/models/articles.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'new_api_service.g.dart';

@RestApi(baseUrl: 'https://newsapi.org/v2')
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/everything')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query('apiKey') String apiKey,
    @Query('q') String query,
    @Query('from') String from,
    @Query('sortBy') String sortBy,
  });
}
