import 'package:equatable/equatable.dart';
import 'package:sillicont_tv/features/shows/domain/entities/episode.dart';
import 'package:sillicont_tv/features/shows/domain/entities/season.dart';
import 'package:sillicont_tv/features/shows/domain/entities/show.dart';


class CreatorsEntity extends Equatable {
  final String ? name;
  final String ? profilePath;

  const CreatorsEntity({this.name, this.profilePath});

  @override
  List<Object?> get props => [name, profilePath];
}

class ShowDetailsEntity extends ShowEntity {

  final bool ? adult;
  final List<CreatorsEntity> ? createdBy;
  final int ? episodeRuntime;
  final String ? homepage;
  final bool ? inProduction;
  final List<String> ? languages;
  final String ? lastAirDate;
  final EpisodeEntity ? lastEpisodeToAir;
  final int ? numberOfEpisodes;
  final int ? numberOfSeasons;
  final List<SeasonEntity> ? seasons;
  final List<String> ? spokenLanguages;
  final String ? status;

  const ShowDetailsEntity({
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

    this.adult,
    this.createdBy,
    this.episodeRuntime,
    this.homepage,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.seasons,
    this.spokenLanguages,
    this.status
  });

  @override
  List<Object?> get props => [
    backdropPath,
    firstAirDate,
    genreIds,
    id,
    name,
    originCountry,
    originalLanguage,
    originalName,
    overview,
    popularity,
    posterPath,
    voteAverage,
    voteCount,

    adult,
    createdBy,
    episodeRuntime,
    homepage,
    inProduction,
    languages,
    lastAirDate,
    lastEpisodeToAir,
    numberOfEpisodes,
    numberOfSeasons,
    seasons,
    spokenLanguages,
    status
  ];

}