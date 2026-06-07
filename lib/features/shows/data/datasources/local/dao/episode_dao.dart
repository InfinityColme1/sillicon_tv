import 'package:floor/floor.dart';
import 'package:sillicont_tv/features/shows/data/models/episode.dart';

@dao
abstract class EpisodeDao {

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertEpisode(EpisodeModel episode);

  @Query('SELECT * FROM EpisodeModels')
  Future<List<EpisodeModel>> getEpisodes();

  @Query('SELECT * FROM EpisodeModels WHERE id = :id')
  Future<EpisodeModel?> getEpisodeById(int id);
}