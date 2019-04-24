// To parse this JSON data, do
//
//     final genre = genreFromJson(jsonString);

import 'dart:convert';

Genre genreFromJson(String str) => Genre.fromJson(json.decode(str));

String genreToJson(Genre data) => json.encode(data.toJson());

class Genre {
  List<GenreElement> genres;

  Genre({
    this.genres,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => new Genre(
    genres: new List<GenreElement>.from(json["genres"].map((x) => GenreElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "genres": new List<dynamic>.from(genres.map((x) => x.toJson())),
  };
}

class GenreElement {
  int id;
  String name;

  GenreElement({
    this.id,
    this.name,
  });

  factory GenreElement.fromJson(Map<String, dynamic> json) => new GenreElement(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}