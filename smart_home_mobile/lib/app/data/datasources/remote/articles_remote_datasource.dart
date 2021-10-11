// import 'package:meta/meta.dart';
// import 'package:dio/dio.dart';
// import 'package:smart_home/app/data/api/api.dart';
//
// const ERROR_MSG = 'Something went wrong';
//
// class ArticlesRemoteDatasource {
//   final RestClient client;
//   ArticlesRemoteDatasource({required this.client});
//
//   /// get articles from api endpoint
//   /// return Failure if catch error or status code is not 200
//   /// return decoded data as Map if status code is 200
//   Future<List<ArticleModel>> getArticles() async {
//     try {
//       final articles = await client.getTopHeadlines(env['API_KEY']);
//       return Right(articles);
//     } on DioError catch (error) {
//       print(error.type);
//       print(error.message);
//       return Left(Failure(error.message));
//     } on Exception catch (_) {
//       return const Left(Failure(ERROR_MSG));
//     }
//   }
// }
