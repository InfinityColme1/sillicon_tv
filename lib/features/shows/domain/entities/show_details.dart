import 'package:equatable/equatable.dart';
import 'package:sillicont_tv/features/shows/data/models/creator.dart';
import 'package:sillicont_tv/features/shows/data/models/genre.dart';
import 'package:sillicont_tv/features/shows/data/models/show.dart';
import 'package:sillicont_tv/features/shows/data/models/show_details.dart';
import 'package:sillicont_tv/features/shows/domain/entities/episode.dart';
import 'package:sillicont_tv/features/shows/domain/entities/genre.dart';
import 'package:sillicont_tv/features/shows/domain/entities/season.dart';
import 'package:sillicont_tv/features/shows/domain/entities/show.dart';

import '../../data/models/episode.dart';
import '../../data/models/season.dart';
import 'creator.dart';


class ShowDetailsEntity extends ShowEntity {

  final bool ? adult;
  final List<CreatorEntity> ? createdBy;
  final int ? episodeRuntime;
  final String ? homepage;
  final bool ? inProduction;
  final List<String> ? languages;
  final String ? lastAirDate;
  final EpisodeEntity ? lastEpisodeToAir;
  final int ? numberOfEpisodes;
  final int ? numberOfSeasons;
  final List<SeasonEntity> ? seasons;
  final String ? status;

  const ShowDetailsEntity({
    required super.id,
    super.backdropPath,
    super.firstAirDate,
    super.genres,
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
    this.status
  });

  @override
  List<Object?> get props => [
    id,
    backdropPath,
    firstAirDate,
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
    status
  ];

  factory ShowDetailsEntity.fromModels({
    required ShowModel showModel,
    required ShowDetailsModel showDetailsModel,
    List<GenreModel> ? genres,
    EpisodeModel ? lastEpisodeToAir,
    required List<CreatorModel> creators,
    List<String> ? languages,
    required List<SeasonModel> seasons,
  }) {

    return ShowDetailsEntity(
      id: showModel.id,
      backdropPath: showModel.backdropPath,
      firstAirDate: showModel.firstAirDate,
      genres: genres?.map((g) => GenreEntity.fromModel(g)).toList() ?? [],
      name: showModel.name,
      originCountry: showModel.originCountry,
      originalLanguage: showModel.originalLanguage,
      originalName: showModel.originalName,
      overview: showModel.overview,
      popularity: showModel.popularity,
      posterPath: showModel.posterPath,
      voteAverage: showModel.voteAverage,
      voteCount: showModel.voteCount,

      adult: showDetailsModel.adult,
      createdBy: creators.map((c) => CreatorEntity.fromModel(c)).toList(),
      episodeRuntime: showDetailsModel.episodeRuntime,
      homepage: showDetailsModel.homepage,
      inProduction: showDetailsModel.inProduction,
      languages: languages ?? [],
      lastAirDate: showDetailsModel.lastAirDate,
      lastEpisodeToAir: EpisodeEntity.fromModel(episodeModel: lastEpisodeToAir),
      numberOfEpisodes: showDetailsModel.numberOfEpisodes,
      numberOfSeasons: showDetailsModel.numberOfSeasons,
      seasons: seasons.map((s) => SeasonEntity.fromModel(s)).toList(),
      status: showDetailsModel.status
    );
  }

}