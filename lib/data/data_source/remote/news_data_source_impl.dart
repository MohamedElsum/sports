import 'package:sports/data/data_source/remote/news_data_source.dart';
import 'package:sports/data/web_services/news_web_services.dart';

class NewsDataSourceImpl implements NewsDataSource {
  final NewsWebServices newsWebServices;

  NewsDataSourceImpl(this.newsWebServices);

  @override
  Future<dynamic>? getNews() async {
    final newsRes = await newsWebServices.getNews();
    return newsRes;
  }
}
