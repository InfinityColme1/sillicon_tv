import 'package:equatable/equatable.dart';
import 'package:sillicont_tv/features/shows/data/models/episode.dart';

class EpisodeEntity extends Equatable {
  final int id;
  final String ? name;
  final String ? overview;
  final double ? voteAverage;
  final String ? airDate;
  final int ? episodeNumber;
  final int ? seasonNumber;
  final String ? stillPath;

  const  EpisodeEntity ({
    required this.id,
    this.name,
    this.overview,
    this.voteAverage,
    this.airDate,
    this.episodeNumber,
    this.seasonNumber,
    this.stillPath
  });

  @override
  List<Object?> get props => [
    id,
    name,
    overview,
    voteAverage,
    airDate,
    episodeNumber,
    seasonNumber,
    stillPath,
  ];

  factory EpisodeEntity.fromModel({EpisodeModel ? episodeModel}) {
    return EpisodeEntity(
      id: episodeModel!.id,
      name: episodeModel.name,
      overview: episodeModel.overview,
      voteAverage: episodeModel.voteAverage,
      airDate: episodeModel.airDate,
      episodeNumber: episodeModel.episodeNumber,
      seasonNumber: episodeModel.seasonNumber,
      stillPath: episodeModel.stillPath,
    );
  }


}