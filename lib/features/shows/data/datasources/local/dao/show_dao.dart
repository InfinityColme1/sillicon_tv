import 'package:floor/floor.dart';
import '../../../models/show.dart';


@dao
abstract class ShowDao {

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertShow(ShowModel show);
  
  @Query('SELECT * FROM ShowModels')
  Future<List<ShowModel>> getShows();

  @Query('SELECT * FROM ShowModels WHERE id = :id')
  Future<ShowModel?> getShowById(int id);
}