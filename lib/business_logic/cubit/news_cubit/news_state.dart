import 'package:equatable/equatable.dart';
import '../../../domain/models/news_data.dart';

abstract class NewsStates extends Equatable {
  const NewsStates();
}

class NewsInitial extends NewsStates {
  @override
  List<Object> get props => [];
}

class NewsLoading extends NewsStates {
  @override
  List<Object> get props => [];
}

class NewsSuccess extends NewsStates {
  final List<NewsData> newsResponse;

  const NewsSuccess(this.newsResponse);

  @override
  List<Object> get props => [newsResponse];
}

class NewsFailed extends NewsStates {
  final NewsData newsResponse;

  const NewsFailed(this.newsResponse);

  @override
  List<Object> get props => [newsResponse];
}
