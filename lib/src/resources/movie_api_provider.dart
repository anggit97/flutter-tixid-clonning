import 'package:flutter/foundation.dart';
import 'package:tix_app/src/config.dart';
import 'package:tix_app/src/models/now_playing_models.dart';
import 'package:http/http.dart' show Client;
import 'dart:async';

class MovieApiProvider{

  Client client = new Client();

  var _urlNowPlaying = "${ConfigApiGlobals().baseUrl}movie/now_playing?api_key=${ConfigApiGlobals().apiKey}&region=${RegionApiGlobals().id}";
  var _urlPopular = "${ConfigApiGlobals().baseUrl}movie/popular?api_key=${ConfigApiGlobals().apiKey}&region=${RegionApiGlobals().id}";

  Future<NowPlayingMovies> fetchMovieNowPlaying() async{
    final response = await client.get(_urlNowPlaying);
    if(response.statusCode == 200){
      return compute(nowPlayingMoviesFromJson,response.body);
    }else{
      throw Exception("Failed to fetch data");
    }
  }

  Future<NowPlayingMovies> fetchMoviePopular() async{
    final response = await client.get(_urlPopular);
    if(response.statusCode == 200){
      return compute(nowPlayingMoviesFromJson, response.body);
    }else{
      throw Exception("Failed to fetch popular movie");
    }
  }
}