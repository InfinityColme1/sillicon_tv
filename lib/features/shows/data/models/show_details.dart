import 'package:sillicont_tv/features/shows/data/models/episode.dart';
import 'package:sillicont_tv/features/shows/data/models/season.dart';
import 'package:sillicont_tv/features/shows/domain/entities/show_details.dart';


class CreatorsModel extends CreatorsEntity {

  const CreatorsModel({
    super.name,
    super.profilePath
  });

  factory CreatorsModel.fromJson(Map<String, dynamic> map) {
    return CreatorsModel(
      name: map['name'],
      profilePath: map['profile_path']
    );
  }
}


class ShowDetailsModel extends ShowDetailsEntity {
  const ShowDetailsModel({
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

    super.adult,
    super.createdBy,
    super.episodeRuntime,
    super.homepage,
    super.inProduction,
    super.languages,
    super.lastAirDate,
    super.lastEpisodeToAir,
    super.numberOfEpisodes,
    super.numberOfSeasons,
    super.seasons,
    super.spokenLanguages,
    super.status
  });

  factory ShowDetailsModel.fromJson(Map<String, dynamic> map) {

    List<dynamic> genreList = map['genres'] ?? [];
    List<dynamic> creatorsList = map['created_by'] ?? [];
    List<dynamic> seasonList = map['seasons'] ?? [];
    List<dynamic> spokenLangList = map['spoken_languages'] ?? [];

    return ShowDetailsModel(
      backdropPath: map["backdrop_path"] ?? "",
      firstAirDate: map["first_air_date"] ?? "",
      genreIds: genreList.map((e) => e['id'] as int).toList(),
      genreNames: genreList.map((e) => e['name'] as String).toList() ,
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

      adult: map['adult'],
      createdBy: creatorsList.map((e) => CreatorsModel.fromJson(e)).toList(),
      episodeRuntime: map['episode_runtime'],
      homepage: map['homepage'],
      inProduction: map['inProduction'],
      languages: ['languages'],
      lastAirDate: map['last_air_date'],
      lastEpisodeToAir: EpisodeModel.fromJson(map['last_episode_to_air']),
      numberOfEpisodes: map['number_of_episodes'],
      numberOfSeasons: map['number_of_seasons'],
      seasons: seasonList.map((e) => SeasonModel.fromJson(e)).toList(),
      spokenLanguages: spokenLangList.map((e) => e['name'] as String).toList(),
      status: map['status']
    );
  }
}