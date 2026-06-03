import 'package:equatable/equatable.dart';

class SeasonEntity extends Equatable {
  final String ? airDate;
  final int ? episodeCount;
  final String ? name;
  final String ? overview;
  final String ? posterPath;
  final int ? seasonNumber;
  final double ? voteAverage;

  const  SeasonEntity({
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
    airDate,
    episodeCount,
    name,
    overview,
    posterPath,
    seasonNumber,
    voteAverage
  ];




}