import 'package:retrofit/http.dart';
import 'package:dio/dio.dart'; 
// part 'new_api_service.dart';

@RestApi(baseUrl: Envire )
abstract class NewsApiService {
  
  factory NewsApiService(Dio dio) = _NewsApiService;



}