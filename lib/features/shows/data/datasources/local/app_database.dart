import 'package:floor/floor.dart';
import 'package:sillicont_tv/features/shows/data/datasources/local/dao/episode_dao.dart';
import 'package:sillicont_tv/features/shows/data/datasources/local/dao/genre_dao.dart';
import 'package:sillicont_tv/features/shows/data/datasources/local/dao/season_dao.dart';
import 'package:sillicont_tv/features/shows/data/datasources/local/dao/relations/show_creators_dao.dart';
import 'package:sillicont_tv/features/shows/data/datasources/local/dao/show_details_dao.dart';
import 'package:sillicont_tv/features/shows/data/models/episode.dart';
import 'package:sillicont_tv/features/shows/data/models/season.dart';
import 'package:sillicont_tv/features/shows/data/models/show.dart';
import 'package:sillicont_tv/features/shows/data/models/show_details.dart';
import '../../models/creator.dart';
import '../../models/genre.dart';
import '../../models/relations/show_creators.dart';
import '../../models/relations/show_genres.dart';
import 'converters/int_list_converter.dart';
import 'converters/str_list_converter.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
import 'dao/relations/show_genres_dao.dart';
import 'dao/show_dao.dart';

part 'app_database.g.dart';

@TypeConverters([IntListConverter, StrListConverter])
@Database(version: 2, entities: [
  ShowModel,
  GenreModel,
  EpisodeModel,
  SeasonModel,
  CreatorModel,
  ShowDetailsModel,
  ShowCreatorsModel,
  ShowGenresModel
])
abstract class AppDatabase extends FloorDatabase{

  ShowDao get showDao;
  SeasonDao get seasonDao;
  EpisodeDao get episodeDao;
  GenreDao get genreDao;
  CreatorsDao get creatorsDao;
  ShowDetailsDao get showDetailsDao;

  ShowCreatorsDao get showCreatorsDao;
  ShowGenresDao get showGenresDao;

  @transaction
  Future<void> saveShowDetailsComplete(
      ShowDetailsModel details,
      EpisodeModel episode,
      List<CreatorModel> creators,
      List<SeasonModel> seasons
      ) async {

    await episodeDao.insertEpisode(episode);
    await showDetailsDao.insertShowDetails(details);

    for (var creator in creators) {
      await creatorsDao.insertCreator(creator);
      await showCreatorsDao.insertShowCreator(
          ShowCreatorsModel(showId: details.id, creatorId: creator.id)
      );
    }

    for (var season in seasons) {
      await seasonDao.insertSeason(season);
    }
  }
}