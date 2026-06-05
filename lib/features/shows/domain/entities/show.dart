import 'package:equatable/equatable.dart';
import 'package:sillicont_tv/features/shows/data/models/genre.dart';
import 'package:sillicont_tv/features/shows/data/models/show.dart';
import 'package:sillicont_tv/features/shows/domain/entities/genre.dart';

class ShowEntity extends Equatable {
  final int id;
  final String ? backdropPath;
  final String ? firstAirDate;
  final List<GenreEntity> ? genres;
  final String ? name;
  final List<String> ? originCountry;
  final String ? originalLanguage;
  final String ? originalName;
  final String ? overview;
  final double ? popularity;
  final String ? posterPath;
  final double ? voteAverage;
  final int ? voteCount;

  const ShowEntity({
    required this.id,
    this.backdropPath, 
    this.firstAirDate,
    this.genres,
    this.name, 
    this.originCountry, 
    this.originalLanguage, 
    this.originalName, 
    this.overview, 
    this.popularity, 
    this.posterPath, 
    this.voteAverage, 
    this.voteCount,
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
  ];

  factory ShowEntity.fromModel(ShowModel model, List<GenreModel> ? genreNames) {
    return ShowEntity(
      id: model.id,
      backdropPath: model.backdropPath,
      firstAirDate: model.firstAirDate,
      genres: genreNames?.map((g) => GenreEntity.fromModel(g)).toList() ?? [],
      name: model.name,
      originCountry: model.originCountry,
      originalLanguage: model.originalLanguage,
      originalName: model.originalName,
      overview: model.overview,
      popularity: model.popularity,
      posterPath: model.posterPath,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
    );
  }

  ShowEntity copyWith({
    String ? backdropPath,
    String ? firstAirDate,
    List<int> ? genreIds,
    List<GenreEntity> ? genres,
    int ? id,
    String ? name,
    List<String> ? originCountry,
    String ? originalLanguage,
    String ? originalName,
    String ? overview,
    double ? popularity,
    String ? posterPath,
    double ? voteAverage,
    int ? voteCount,
  }) {
    return ShowEntity(
      backdropPath: backdropPath ?? this.backdropPath,
      firstAirDate: firstAirDate ?? this.firstAirDate,
      genres: genres ?? this.genres,
      id: id ?? this.id,
      name: name ?? this.name,
      originCountry: originCountry ?? this.originCountry,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalName: originalName ?? this.originalName,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }
  }
