import 'package:tix_app/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tix_app/src/models/genre_models.dart';
import 'package:tix_app/src/models/genre_detail_model.dart';

class GenreBloc{

  final _repository = Repository();
  final _genreApiFetcher = PublishSubject<Genre>();
  Observable<Genre> get genres => _genreApiFetcher.stream;

  final _genreDetailFetcher = PublishSubject<GenreDetail>();
  Observable<GenreDetail> get genreDetail => _genreDetailFetcher.stream;


  fetchAllGenres() async{
    Genre response = await _repository.fetchAllGenres();
    _genreApiFetcher.sink.add(response);
  }

  fetchGenreDetail(String id) async{
    GenreDetail response = await _repository.fetchDetailGenre(id);
    _genreDetailFetcher.sink.add(response);
  }

  dispose(){
    _genreApiFetcher.close();
    _genreDetailFetcher.close();
  }
}

final GenreBloc genreBloc = GenreBloc();