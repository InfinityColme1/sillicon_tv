

import 'package:sillicont_tv/features/shows/domain/entities/season.dart';

class SeasonModel extends SeasonEntity {
  const SeasonModel({
    super.airDate,
    super.episodeCount,
    super.name,
    super.overview,
    super.posterPath,
    super.seasonNumber,
    super.voteAverage
  });

  factory SeasonModel.fromJson(Map<String, dynamic> map) {
    return SeasonModel(
      airDate: map['air_date'],
      episodeCount: map['episodeCount'],
      name: map['name'],
      overview: map['overview'],
      posterPath: map['poster_path'],
      seasonNumber: map['season_number'],
      voteAverage: map['vote_average']
    );
  }
}