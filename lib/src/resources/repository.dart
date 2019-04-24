import 'package:tix_app/src/models/now_playing_models.dart';
import 'package:tix_app/src/resources/movie_api_provider.dart';

class Repository{

  final _movieApiProvider = MovieApiProvider();

  Future<NowPlayingMovies> fetchNowPlaying() => _movieApiProvider.fetchMovieNowPlaying();
}