import 'package:tix_app/src/models/now_playing_models.dart';
import 'package:tix_app/src/resources/genre_api_provider.dart';
import 'package:tix_app/src/resources/movie_api_provider.dart';
import 'package:tix_app/src/models/genre_models.dart';
import 'package:tix_app/src/models/genre_detail_model.dart';
import 'dart:async';

class Repository{

  final _movieApiProvider = MovieApiProvider();
  final _genreApiProvider = GenreApiProvider();

  Future<NowPlayingMovies> fetchNowPlaying() => _movieApiProvider.fetchMovieNowPlaying();
  Future<NowPlayingMovies> fetchPopularMovie() => _movieApiProvider.fetchMoviePopular();

  Future<Genre> fetchAllGenres() => _genreApiProvider.fetchAllGenres();
  Future<GenreDetail> fetchDetailGenre(String id) => _genreApiProvider.fetchDetailGenre(id);
}