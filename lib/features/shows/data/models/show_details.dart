import 'package:floor/floor.dart';
import 'package:sillicont_tv/features/shows/domain/entities/show_details.dart';


@Entity(
    tableName: 'ShowDetailsModels',
)
class ShowDetailsModel {

  @primaryKey
  final int id;

  final bool ? adult;
  final int ? episodeRuntime;
  final String ? homepage;
  final bool ? inProduction;
  final String ? lastAirDate;
  final int ? idLastEpisodeToAir;
  final int ? numberOfEpisodes;
  final int ? numberOfSeasons;
  final List<String> ? languages;
  final String ? status;
  final String ? tagline;
  final String ? type;


  const ShowDetailsModel({
    required this.id,
    this.adult,
    this.episodeRuntime,
    this.homepage,
    this.inProduction,
    this.lastAirDate,
    this.idLastEpisodeToAir,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.languages,
    this.status,
    this.tagline,
    this.type,
  });

  factory ShowDetailsModel.fromJson(Map<String, dynamic> map) {

    var languages =  map['languages'];
    languages ??= [];

    return ShowDetailsModel(
        id: map["id"] ?? 0,
        adult: map['adult'],
        episodeRuntime: map['episode_runtime'],
        homepage: map['homepage'],
        inProduction: map['inProduction'],
        lastAirDate: map['last_air_date'],
        idLastEpisodeToAir: map['last_episode_to_air']['id'],
        numberOfEpisodes: map['number_of_episodes'],
        numberOfSeasons: map['number_of_seasons'],
        languages: languages.cast<String>(),
        status: map['status'],
        tagline: map['tagline'],
        type: map['type'],
    );
  }

  factory ShowDetailsModel.fromEntity(ShowDetailsEntity entt) {
    return ShowDetailsModel(
        id: entt.id,
        adult: entt.adult,
        episodeRuntime: entt.episodeRuntime,
        homepage: entt.homepage,
        inProduction: entt.inProduction,
        lastAirDate: entt.lastAirDate,
        idLastEpisodeToAir: entt.lastEpisodeToAir!.id,
        numberOfEpisodes: entt.numberOfEpisodes,
        numberOfSeasons: entt.numberOfSeasons,
        languages: entt.languages,
        status: entt.status,
        tagline: entt.tagline,
        type: entt.type,
    );
  }
}