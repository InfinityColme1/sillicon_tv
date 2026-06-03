import 'package:sillicont_tv/features/shows/domain/entities/episode.dart';

class EpisodeModel extends EpisodeEntity {

  const EpisodeModel({
      super.name,
      super.overview,
      super.voteAverage,
      super.airDate,
      super.episodeNumber,
      super.seasonNumber,
      super.stillPath
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> map) {
    return EpisodeModel(
      name: map['name'],
      overview: map['overview'],
      voteAverage: map['vote_average'],
      airDate: map['air_date'],
      episodeNumber: map['episode_number'],
      seasonNumber: map['season_number'],
      stillPath: map['still_path']
    );
  }

}