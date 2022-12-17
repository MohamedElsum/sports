import 'package:sports/domain/models/news_data.dart';

abstract class NewsRepo {
  Future<List<NewsData>?>? getNews();
}
