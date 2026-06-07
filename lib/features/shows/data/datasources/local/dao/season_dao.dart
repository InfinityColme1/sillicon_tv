import 'package:floor/floor.dart';
import 'package:sillicont_tv/features/shows/data/models/season.dart';


@dao
abstract class SeasonDao {

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertSeason(SeasonModel season);

  @Query('SELECT * FROM SeasonModels')
  Future<List<SeasonModel>> getSeasons();

  @Query('SELECT * FROM SeasonModels WHERE showId = :id')
  Future<List<SeasonModel>> getSeasonsByShowId(int id);
}