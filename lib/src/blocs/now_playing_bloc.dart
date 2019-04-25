import 'package:tix_app/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tix_app/src/models/now_playing_models.dart';
import 'package:tix_app/src/models/genre_models.dart';

class NowPlayingBloc {
  final _repository = Repository();
  final _nowPlayingFetcher = BehaviorSubject<NowPlayingMovies>();
  final _popularMovie = BehaviorSubject<NowPlayingMovies>();

  Observable<NowPlayingMovies> get nowPlaying => _nowPlayingFetcher.stream;
  Observable<NowPlayingMovies> get moviePopular => _popularMovie.stream;

  fetchNowPlayingMovies() async {
    NowPlayingMovies response = await _repository.fetchNowPlaying();
    Genre responseGenres = await _repository.fetchAllGenres();

    response.results.forEach((result) {
      result.genreIds.forEach((idGenre) {
        String genreName = "";
        responseGenres.genres.forEach((item){
          if(idGenre == item.id){
            genreName += item.name;
          }
        });
        result.genresNames = genreName;
      });
    });
    _nowPlayingFetcher.sink.add(response);
  }


  fetchPopularMovie() async{
    NowPlayingMovies response = await _repository.fetchNowPlaying();
    Genre responseGenres = await _repository.fetchAllGenres();

    response.results.forEach((result) {
      result.genreIds.forEach((idGenre) {
        String genreName = "";
        responseGenres.genres.forEach((item){
          if(idGenre == item.id){
            genreName += item.name;
          }
        });
        result.genresNames = genreName;
      });
    });
    _popularMovie.sink.add(response);
  }

  dispose() {
    _nowPlayingFetcher.close();
    _popularMovie.close();
  }
}

final bloc = NowPlayingBloc();
