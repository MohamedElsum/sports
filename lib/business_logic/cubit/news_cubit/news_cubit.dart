import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports/business_logic/cubit/news_cubit/news_state.dart';
import 'package:sports/domain/models/news_data.dart';
import 'package:sports/domain/usecase/news_usecase.dart';

class NewsCubit extends Cubit<NewsStates> {
  final NewsUsecase _newsUsecase;
  late List<NewsData> _newsResponse = [];

  List<NewsData> get newsResponse => _newsResponse;

  NewsCubit(
    this._newsUsecase,
  ) : super(NewsInitial());

  Future<void> getNews() async {
    emit(NewsLoading());
    final newsRes = await _newsUsecase.getNews();
    _newsResponse = newsRes!;
    emit(NewsSuccess(newsRes));
  }
}
