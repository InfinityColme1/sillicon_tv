import 'package:floor/floor.dart';
import 'package:sillicont_tv/features/shows/domain/entities/episode.dart';


@Entity(tableName: 'EpisodeModels')
class EpisodeModel {

  @primaryKey
  final int id;
  final String ? name;
  final String ? overview;
  final double ? voteAverage;
  final String ? airDate;
  final int ? episodeNumber;
  final int ? seasonNumber;
  final String ? stillPath;

  const EpisodeModel({
    required this.id,
    this.name,
    this.overview,
    this.voteAverage,
    this.airDate,
    this.episodeNumber,
    this.seasonNumber,
    this.stillPath
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> map) {
    return EpisodeModel(
      id: map['id'],
      name: map['name'],
      overview: map['overview'],
      voteAverage: map['vote_average'],
      airDate: map['air_date'],
      episodeNumber: map['episode_number'],
      seasonNumber: map['season_number'],
      stillPath: map['still_path']
    );
  }

  factory EpisodeModel.fromEntity(EpisodeEntity entt) {
    return EpisodeModel(
      id: entt.id,
      name: entt.name,
      overview: entt.overview,
      voteAverage: entt.voteAverage,
      airDate: entt.airDate,
      episodeNumber: entt.episodeNumber,
      seasonNumber: entt.seasonNumber,
      stillPath: entt.stillPath
    );
  }

}