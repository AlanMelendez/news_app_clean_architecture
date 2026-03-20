import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/data_sources/remote/new_api_service.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  //Dependecies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  //Repositories
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  //Blocs
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));

  //Usecases

  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
}
