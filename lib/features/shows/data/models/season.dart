import 'package:floor/floor.dart';
import 'package:sillicont_tv/features/shows/data/models/show_details.dart';
import 'package:sillicont_tv/features/shows/domain/entities/season.dart';


@Entity(
  tableName: 'SeasonModels',
)
class SeasonModel {

  @primaryKey
  final int id;

  final int showId;
  final String ? airDate;
  final int ? episodeCount;
  final String ? name;
  final String ? overview;
  final String ? posterPath;
  final int ? seasonNumber;
  final double ? voteAverage;


  const SeasonModel({
    required this.id,
    required this.showId,
    this.airDate,
    this.episodeCount,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
    this.voteAverage
  });

  factory SeasonModel.fromJson(Map<String, dynamic> map, int showId) {
    return SeasonModel(
      id: map['id'],
      showId: showId,
      airDate: map['air_date'],
      episodeCount: map['episodeCount'],
      name: map['name'],
      overview: map['overview'],
      posterPath: map['poster_path'],
      seasonNumber: map['season_number'],
      voteAverage: map['vote_average']
    );
  }

  factory SeasonModel.fromEntity(SeasonEntity entt, int showId) {
    return SeasonModel(
      id: entt.id!,
      showId: showId,
      airDate: entt.airDate,
      episodeCount: entt.episodeCount,
      name: entt.name,
      overview: entt.overview,
      posterPath: entt.posterPath,
      seasonNumber: entt.seasonNumber,
      voteAverage: entt.voteAverage
    );
  }
}