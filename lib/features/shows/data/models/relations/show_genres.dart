import 'package:floor/floor.dart';
import 'package:sillicont_tv/features/shows/data/models/genre.dart';
import 'package:sillicont_tv/features/shows/data/models/show.dart';


@Entity(
    tableName: 'ShowGenres',
)
class ShowGenresModel {

  @primaryKey
  final int id;
  final int showId;
  final int genreId;

  ShowGenresModel({
    required this.id,
    required  this.showId,
    required this.genreId
  });
}