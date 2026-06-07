import 'package:floor/floor.dart';
import 'package:sillicont_tv/features/shows/data/datasources/local/dao/companies_dao.dart';
import 'package:sillicont_tv/features/shows/data/datasources/local/dao/episode_dao.dart';
import 'package:sillicont_tv/features/shows/data/datasources/local/dao/genre_dao.dart';
import 'package:sillicont_tv/features/shows/data/datasources/local/dao/networks_dao.dart';
import 'package:sillicont_tv/features/shows/data/datasources/local/dao/relations/show_companies_dao.dart';
import 'package:sillicont_tv/features/shows/data/datasources/local/dao/relations/show_networks.dart';
import 'package:sillicont_tv/features/shows/data/datasources/local/dao/season_dao.dart';
import 'package:sillicont_tv/features/shows/data/datasources/local/dao/relations/show_creators_dao.dart';
import 'package:sillicont_tv/features/shows/data/datasources/local/dao/show_details_dao.dart';
import 'package:sillicont_tv/features/shows/data/models/companies.dart';
import 'package:sillicont_tv/features/shows/data/models/episode.dart';
import 'package:sillicont_tv/features/shows/data/models/networks.dart';
import 'package:sillicont_tv/features/shows/data/models/season.dart';
import 'package:sillicont_tv/features/shows/data/models/show.dart';
import 'package:sillicont_tv/features/shows/data/models/show_details.dart';
import '../../models/creator.dart';
import '../../models/genre.dart';
import '../../models/relations/show_companies.dart';
import '../../models/relations/show_creators.dart';
import '../../models/relations/show_genres.dart';
import '../../models/relations/show_network.dart';
import 'converters/int_list_converter.dart';
import 'converters/str_list_converter.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
import 'dao/relations/show_genres_dao.dart';
import 'dao/show_dao.dart';

part 'app_database.g.dart';

@TypeConverters([IntListConverter, StrListConverter])
@Database(version: 3, entities: [
  ShowModel,
  GenreModel,
  EpisodeModel,
  SeasonModel,
  CreatorModel,
  CompaniesModel,
  NetworksModel,

  ShowDetailsModel,
  ShowCreatorsModel,
  ShowGenresModel,
  ShowCompaniesModel,
  ShowNetworkModel

])
abstract class AppDatabase extends FloorDatabase{

  ShowDao get showDao;
  SeasonDao get seasonDao;
  EpisodeDao get episodeDao;
  GenreDao get genreDao;
  CreatorsDao get creatorsDao;
  ShowDetailsDao get showDetailsDao;
  CompaniesDao get companiesDao;
  NetworksDao get networksDao;

  ShowCreatorsDao get showCreatorsDao;
  ShowGenresDao get showGenresDao;
  ShowCompaniesDao get showCompaniesDao;
  ShowNetworksDao get showNetworksDao;

  @transaction
  Future<void> saveShowDetailsComplete(
      ShowDetailsModel details,
      EpisodeModel episode,
      List<CreatorModel> creators,
      List<SeasonModel> seasons,
      List<CompaniesModel> companies,
      List<NetworksModel> networks
      ) async {

    await episodeDao.insertEpisode(episode);
    await showDetailsDao.insertShowDetails(details);

    for (var creator in creators) {
      await creatorsDao.insertCreator(creator);
      await showCreatorsDao.insertShowCreator(
          ShowCreatorsModel(showId: details.id, creatorId: creator.id)
      );
    }

    for (var company in companies) {
      await companiesDao.insertCompany(company);
      await showCompaniesDao.insertShowCompany(
          ShowCompaniesModel(showId: details.id, companyId: company.id)
      );
    }

    for (var network in networks) {
      await networksDao.insertNetwork(network);
      await showNetworksDao.insertShowNetwork(
          ShowNetworkModel(showId: details.id, networkId: network.id)
      );
    }

    for (var season in seasons) {
      await seasonDao.insertSeason(season);
    }
  }
}