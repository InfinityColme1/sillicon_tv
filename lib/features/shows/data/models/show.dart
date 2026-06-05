import 'package:floor/floor.dart';
import 'package:sillicont_tv/features/shows/domain/entities/show.dart';


@Entity(tableName: 'ShowModels')
class ShowModel {

  @primaryKey
  final int id;
  final List<int> genreIds;
  final String ? backdropPath;
  final String ? firstAirDate;
  final String ? name;
  final List<String> ? originCountry;
  final String ? originalLanguage;
  final String ? originalName;
  final String ? overview;
  final double ? popularity;
  final String ? posterPath;
  final double ? voteAverage;
  final int ? voteCount;

  const ShowModel({
    required this.id,
    required this.genreIds,
    this.backdropPath,
    this.firstAirDate,
    this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
  });

  factory ShowModel.fromJson(Map<String, dynamic> map) {
    var genreIds = map['genre_ids'];
    genreIds ??= [];

    return ShowModel(
      backdropPath: map["backdrop_path"] ?? "",
      firstAirDate: map["first_air_date"] ?? "",
      id: map["id"] ?? 0,
      genreIds: genreIds.cast<int>(),
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

  factory ShowModel.fromEntity(ShowEntity entt, List<int> genreIds) {
    return ShowModel(
      backdropPath: entt.backdropPath,
      firstAirDate: entt.firstAirDate,
      id: entt.id,
      genreIds: genreIds,
      name: entt.name,
      originCountry: entt.originCountry,
      originalLanguage: entt.originalLanguage,
      originalName: entt.originalName,
      overview: entt.overview,
      popularity: entt.popularity,
      posterPath: entt.posterPath,
      voteAverage: entt.voteAverage,
      voteCount: entt.voteCount,
    );
  }

}