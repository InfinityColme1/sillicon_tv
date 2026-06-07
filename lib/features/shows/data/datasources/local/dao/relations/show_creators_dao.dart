import 'package:floor/floor.dart';
import 'package:sillicont_tv/features/shows/data/models/relations/show_creators.dart';


@dao
abstract class ShowCreatorsDao {

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertShowCreator(ShowCreatorsModel showCreator);

  @Query('SELECT * FROM ShowCreators')
  Future<List<ShowCreatorsModel>> getShowCreators();

  @Query('SELECT * FROM ShowCreators WHERE showId = :id')
  Future<List<ShowCreatorsModel>> getCreatorsByShowId(int id);
}