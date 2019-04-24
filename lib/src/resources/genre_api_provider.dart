import 'package:flutter/foundation.dart';
import 'package:tix_app/src/config.dart';
import 'package:http/http.dart' show Client;
import 'package:tix_app/src/models/genre_models.dart';
import 'package:tix_app/src/models/genre_detail_model.dart';
import 'dart:async';

class GenreApiProvider{

  Client client = new Client();
  var _url = "${ConfigApiGlobals().baseUrl}genre/movie/list?api_key=${ConfigApiGlobals().apiKey}&region=${RegionApiGlobals().id}";

  Future<Genre> fetchAllGenres() async{
    final response = await client.get(_url);
    if(response.statusCode == 200){
      return compute(genreFromJson, response.body);
    }else{
      throw Exception("Failed to load genres");
    }
  }

  Future<GenreDetail> fetchDetailGenre(String id) async{
    var _urlDetail = "${ConfigApiGlobals().baseUrl}genre/$id?api_key=${ConfigApiGlobals().apiKey}&region=${RegionApiGlobals().id}";
    final response = await client.get(_urlDetail);
    if(response.statusCode == 200){
      return compute(genreDetailFromJson, response.body);
    }else{
      throw Exception("Failed to load detail");
    }
  }
}