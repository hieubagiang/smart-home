abstract class ArticlesLocalDatasource {
  Future<bool> initDb();

  Future<bool> deleteDb();

  //Future<bool> insertArticles(List<ArticleModel> articles);
  Future<bool> deleteAllArticles();
//Future<List<ArticleModel>> getArticles();
}
