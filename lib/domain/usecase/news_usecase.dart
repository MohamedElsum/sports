import 'package:sports/data/data_source/remote/news_data_source_impl.dart';
import 'package:sports/data/web_services/news_web_services.dart';
import 'package:sports/domain/models/news_data.dart';
import '../repository_impl/news_impl.dart';

class NewsUsecase {
  late final NewsImpl newsImpl;

  NewsUsecase() {
    newsImpl = NewsImpl(NewsDataSourceImpl(NewsWebServices()));
  }

  Future<List<NewsData>?>? getNews() async {
    final newsRes = await newsImpl.getNews();
    return newsRes;
  }
}
