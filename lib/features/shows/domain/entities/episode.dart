import 'package:equatable/equatable.dart';

class EpisodeEntity extends Equatable {
  final String ? name;
  final String ? overview;
  final double ? voteAverage;
  final String ? airDate;
  final int ? episodeNumber;
  final int ? seasonNumber;
  final String ? stillPath;

  const  EpisodeEntity ({
    this.name,
    this.overview,
    this.voteAverage,
    this.airDate,
    this.episodeNumber,
    this.seasonNumber,
    this.stillPath});
  @override
  List<Object?> get props => [
    name,
    overview,
    voteAverage,
    airDate,
    episodeNumber,
    seasonNumber,
    stillPath,
  ];
}