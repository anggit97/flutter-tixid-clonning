// To parse this JSON data, do
//
//     final nowPlayingMovies = nowPlayingMoviesFromJson(jsonString);

import 'dart:convert';

NowPlayingMovies nowPlayingMoviesFromJson(String str) => NowPlayingMovies.fromJson(json.decode(str));

String nowPlayingMoviesToJson(NowPlayingMovies data) => json.encode(data.toJson());

class NowPlayingMovies {
  List<Result> results;
  int page;
  int totalResults;
  Dates dates;
  int totalPages;

  NowPlayingMovies({
    this.results,
    this.page,
    this.totalResults,
    this.dates,
    this.totalPages,
  });

  factory NowPlayingMovies.fromJson(Map<String, dynamic> json) => new NowPlayingMovies(
    results: new List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    page: json["page"],
    totalResults: json["total_results"],
    dates: Dates.fromJson(json["dates"]),
    totalPages: json["total_pages"],
  );

  Map<String, dynamic> toJson() => {
    "results": new List<dynamic>.from(results.map((x) => x.toJson())),
    "page": page,
    "total_results": totalResults,
    "dates": dates.toJson(),
    "total_pages": totalPages,
  };
}

class Dates {
  DateTime maximum;
  DateTime minimum;

  Dates({
    this.maximum,
    this.minimum,
  });

  factory Dates.fromJson(Map<String, dynamic> json) => new Dates(
    maximum: DateTime.parse(json["maximum"]),
    minimum: DateTime.parse(json["minimum"]),
  );

  Map<String, dynamic> toJson() => {
    "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
    "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
  };
}

class Result {
  int voteCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  double popularity;
  String posterPath;
  OriginalLanguage originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String genresNames;
  String backdropPath;
  bool adult;
  String overview;
  DateTime releaseDate;

  Result({
    this.voteCount,
    this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
    this.genresNames,
  });

  factory Result.fromJson(Map<String, dynamic> json) => new Result(
    voteCount: json["vote_count"],
    id: json["id"],
    video: json["video"],
    voteAverage: json["vote_average"].toDouble(),
    title: json["title"],
    popularity: json["popularity"].toDouble(),
    posterPath: json["poster_path"] == null ? null : json["poster_path"],
    originalLanguage: originalLanguageValues.map[json["original_language"]],
    originalTitle: json["original_title"],
    genreIds: new List<int>.from(json["genre_ids"].map((x) => x)),
    backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
    adult: json["adult"],
    overview: json["overview"],
    releaseDate: DateTime.parse(json["release_date"]),
  );

  Map<String, dynamic> toJson() => {
    "vote_count": voteCount,
    "id": id,
    "video": video,
    "vote_average": voteAverage,
    "title": title,
    "popularity": popularity,
    "poster_path": posterPath == null ? null : posterPath,
    "original_language": originalLanguageValues.reverse[originalLanguage],
    "original_title": originalTitle,
    "genre_ids": new List<dynamic>.from(genreIds.map((x) => x)),
    "genre_names": genresNames,
    "backdrop_path": backdropPath == null ? null : backdropPath,
    "adult": adult,
    "overview": overview,
    "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
  };
}

enum OriginalLanguage { EN, HI, ID, JA }

final originalLanguageValues = new EnumValues({
  "en": OriginalLanguage.EN,
  "hi": OriginalLanguage.HI,
  "id": OriginalLanguage.ID,
  "ja": OriginalLanguage.JA
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
