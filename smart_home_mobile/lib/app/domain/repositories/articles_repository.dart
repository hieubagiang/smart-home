import '../../domain/entities/article.dart';

abstract class ArticlesRepository {
  Future<List<Article>> getRemoteArticles();

  Future<List<Article>> getLocalArticles();
}
