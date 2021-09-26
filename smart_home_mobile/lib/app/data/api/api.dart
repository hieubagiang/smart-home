import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/top-headlines?language=en&pageSize=100&apiKey={apikey}")
  Future<List<int>> getTopHeadlines(@Path('apikey') String apikey);
}
