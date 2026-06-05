import 'package:equatable/equatable.dart';
import 'package:sillicont_tv/features/shows/data/models/season.dart';

class SeasonEntity extends Equatable {
  final int ? id;
  final String ? airDate;
  final int ? episodeCount;
  final String ? name;
  final String ? overview;
  final String ? posterPath;
  final int ? seasonNumber;
  final double ? voteAverage;

  const  SeasonEntity({
    this.id,
    this.airDate,
    this.episodeCount,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
    this.voteAverage
  });

  @override

  List<Object?> get props => [
    id,
    airDate,
    episodeCount,
    name,
    overview,
    posterPath,
    seasonNumber,
    voteAverage
  ];

  factory SeasonEntity.fromModel(SeasonModel model) {
    return SeasonEntity(
      id: model.id,
      airDate: model.airDate,
      episodeCount: model.episodeCount,
      name: model.name,
      overview: model.overview,
      posterPath: model.posterPath,
      seasonNumber: model.seasonNumber,
      voteAverage: model.voteAverage,
    );
  }




}