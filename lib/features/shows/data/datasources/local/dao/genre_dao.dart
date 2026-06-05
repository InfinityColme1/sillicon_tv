import 'package:floor/floor.dart';
import 'package:sillicont_tv/features/shows/data/models/genre.dart';

@dao
abstract class GenreDao {

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertGenre(GenreModel genre);

  @Query('SELECT * FROM GenreModels')
  Future<List<GenreModel>> getGenres();

  @Query('SELECT * FROM GenreModels WHERE id = :id')
  Future<GenreModel?> getGenreById(int id);

  @Query('SELECT id FROM GenreModels WHERE name = :name')
  Future<int?> getGenreIdByName(String name);
}