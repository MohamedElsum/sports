import 'package:dio/dio.dart';
import '../../core/strings.dart';

class NewsWebServices {
  late Dio dio;

  NewsWebServices() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 60 * 1000,
        receiveTimeout: 60 * 1000,
        validateStatus: (status) {
          return true;
        });
    dio = Dio(options);
  }

  Future<dynamic> getNews() async {
    try {
      Response newsRes = await dio.get(
        'news',
      );
      return newsRes.data;
    } catch (e) {
      return [];
    }
  }
}
