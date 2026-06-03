import 'package:sillicont_tv/features/shows/domain/entities/show.dart';


class ShowModel extends ShowEntity {
  const ShowModel({
    super.backdropPath,
    super.firstAirDate,
    super.genreIds,
    super.genreNames,
    super.id,
    super.name,
    super.originCountry,
    super.originalLanguage,
    super.originalName,
    super.overview,
    super.popularity,
    super.posterPath,
    super.voteAverage,
    super.voteCount,
  });

  factory ShowModel.fromJson(Map<String, dynamic> map) {
    return ShowModel(
      backdropPath: map["backdrop_path"] ?? "",
      firstAirDate: map["first_air_date"] ?? "",
      genreIds: map["genre_ids"].cast<int>() ?? [],
      //genre names is not initialized here since it requires a extra request
      id: map["id"] ?? 0,
      name: map["name"] ?? "",
      originCountry: map["origin_country"].cast<String>() ?? [],
      originalLanguage: map["original_language"] ?? "",
      originalName: map["original_name"] ?? "",
      overview: map["overview"] ?? "",
      popularity: map["popularity"] ?? "",
      posterPath: map["poster_path"] ?? "",
      voteAverage: map["vote_average"] ?? 0,
      voteCount: map["vote_count"] ?? 0,
    );
  }

}