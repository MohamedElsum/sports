import '../../data/data_source/remote/news_data_source_impl.dart';
import '../models/news_data.dart';
import '../repository/news_repo.dart';

class NewsImpl implements NewsRepo {
  final NewsDataSourceImpl newsDataSourceImpl;

  NewsImpl(this.newsDataSourceImpl);

  @override
  Future<List<NewsData>?>? getNews() async {
    final newsRes = await newsDataSourceImpl.getNews();
    print(newsRes);
    List<NewsData> list = [];
    newsRes.map((e) {
      list.add(NewsData.fromJson(e));
    }).toList();
    return list;
  }
}
