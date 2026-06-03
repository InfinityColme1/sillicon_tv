// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ShowEntity extends Equatable {
  final String ? backdropPath;
  final String ? firstAirDate;
  final List<int> ? genreIds;
  final List<String> ? genreNames;
  final int ? id;
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
    this.backdropPath, 
    this.firstAirDate, 
    this.genreIds,
    this.genreNames,
    this.id, 
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
  ];

  ShowEntity copyWith({
    String ? backdropPath,
    String ? firstAirDate,
    List<int> ? genreIds,
    List<String> ? genreNames,
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
      genreIds: genreIds ?? this.genreIds,
      genreNames: genreNames ?? this.genreNames,
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
