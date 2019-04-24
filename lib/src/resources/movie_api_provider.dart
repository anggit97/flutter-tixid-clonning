import 'package:flutter/foundation.dart';
import 'package:tix_app/src/config.dart';
import 'package:tix_app/src/models/now_playing_models.dart';
import 'package:http/http.dart' show Client;

class MovieApiProvider{

  Client client = new Client();

  var _url = "${ConfigApiGlobals().baseUrl}/now_playing?api_key=${ConfigApiGlobals().apiKey}&region=${RegionApiGlobals().id}";

  Future<NowPlayingMovies> fetchMovieNowPlaying() async{
    final response = await client.get(_url);
    if(response.statusCode == 200){
      return compute(nowPlayingMoviesFromJson,response.body);
    }else{
      throw Exception("Failed to fetch data");
    }
  }
}