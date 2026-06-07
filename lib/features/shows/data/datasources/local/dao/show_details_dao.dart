import 'package:floor/floor.dart';
import 'package:sillicont_tv/features/shows/data/models/show_details.dart';

import '../../../models/creator.dart';

@dao
abstract class CreatorsDao {

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertCreator(CreatorModel creator);

  @Query('SELECT * FROM CreatorsModels')
  Future<List<CreatorModel>> getCreators();

  @Query('SELECT * FROM CreatorsModels WHERE id = :id')
  Future<CreatorModel?> getCreatorById(int id);
}


@dao
abstract class ShowDetailsDao {

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertShowDetails(ShowDetailsModel showDetails);

  @Query('SELECT * FROM ShowDetailsModels')
  Future<List<ShowDetailsModel>> getShowDetails();

  @Query('SELECT * FROM ShowDetailsModels WHERE id = :id')
  Future<ShowDetailsModel?> getShowDetailsById(int id);

  @Query('SELECT * FROM ShowDetailsModels LIMIT 1')
  Future<ShowDetailsModel?> getFirstShow();
}