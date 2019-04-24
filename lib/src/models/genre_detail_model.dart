// To parse this JSON data, do
//
//     final genreDetail = genreDetailFromJson(jsonString);

import 'dart:convert';

GenreDetail genreDetailFromJson(String str) => GenreDetail.fromJson(json.decode(str));

String genreDetailToJson(GenreDetail data) => json.encode(data.toJson());

class GenreDetail {
  int id;
  String name;

  GenreDetail({
    this.id,
    this.name,
  });

  factory GenreDetail.fromJson(Map<String, dynamic> json) => new GenreDetail(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}