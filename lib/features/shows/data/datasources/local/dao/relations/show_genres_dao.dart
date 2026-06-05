import 'package:floor/floor.dart';
import 'package:sillicont_tv/features/shows/data/models/relations/show_creators.dart';
import 'package:sillicont_tv/features/shows/data/models/relations/show_genres.dart';


@dao
abstract class ShowGenresDao {

  @insert
  Future<void> insertShowGenre(ShowGenresModel showGenre);

  @Query('SELECT * FROM ShowGenres')
  Future<List<ShowGenresModel>> getShowGenres();

  @Query('SELECT * FROM ShowGenres WHERE showId = :id')
  Future<List<ShowGenresModel>> getGenresByShowId(int id);
}