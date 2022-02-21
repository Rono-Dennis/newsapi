import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi/models/article_model.dart';
import 'package:newsapi/newsbloc/news_events.dart';
import 'package:newsapi/newsbloc/news_states.dart';
import 'package:newsapi/repositories/news_repository.dart';

class NewsBloc extends Bloc<NewsEvents, NewsStates> {
  NewsRepository newsRepositoty;
  NewsBloc({required NewsStates initialState, required this.newsRepositoty})
      : super(initialState) {
    add(StartEvent());
  }

  @override
  Stream<NewsStates> mapEventToState(NewsEvents event) async* {
    if (event is StartEvent) {
      try {
        List<ArticleModel> _articleList = [];
        yield NewsLoadingState();
        _articleList = await newsRepositoty.fetchNews();
        yield NewsLoadedState(articleList: _articleList);
      } catch (e) {
        yield NewsErrorState(errorMessage: "error");
      }
    }
  }
}

//bloc completed

// let's deploy this bloc in ui
