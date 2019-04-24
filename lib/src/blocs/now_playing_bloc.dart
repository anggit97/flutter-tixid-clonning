import 'package:tix_app/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tix_app/src/models/now_playing_models.dart';

class NowPlayingBloc{

  final _repository = Repository();
  final _nowPlayingFetcher = PublishSubject<NowPlayingMovies>();
  Observable<NowPlayingMovies> get nowPlaying => _nowPlayingFetcher.stream;
  fetchNowPlayingMovies() async{
    NowPlayingMovies response = await _repository.fetchNowPlaying();
    _nowPlayingFetcher.sink.add(response);
  }

  dispose(){
    _nowPlayingFetcher.close();
  }
}

final nowPlayingMovie = NowPlayingMovies();