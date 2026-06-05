import 'package:dio/dio.dart';
import 'package:sillicont_tv/core/resources/data_state.dart';
import 'package:sillicont_tv/features/shows/data/datasources/local/app_database.dart';
import 'package:sillicont_tv/features/shows/data/datasources/remote/tmdb_api_service.dart';
import 'package:sillicont_tv/features/shows/data/models/companies.dart';
import 'package:sillicont_tv/features/shows/data/models/creator.dart';
import 'package:sillicont_tv/features/shows/data/models/genre.dart';
import 'package:sillicont_tv/features/shows/data/models/season.dart';
import 'package:sillicont_tv/features/shows/data/models/show.dart';
import 'package:sillicont_tv/features/shows/data/models/show_details.dart';
import 'package:sillicont_tv/features/shows/domain/entities/episode.dart';
import 'package:sillicont_tv/features/shows/domain/entities/genre.dart';
import 'package:sillicont_tv/features/shows/domain/entities/show_details.dart';
import 'package:sillicont_tv/features/shows/domain/repository/show_repository.dart';

import '../../domain/entities/show.dart';
import '../models/episode.dart';
import '../models/networks.dart';


class ShowRepositoryImpl implements ShowRepository {

  final TmdbApiService showDatasource;
  final AppDatabase _appDatabase;

  ShowRepositoryImpl({
    required this.showDatasource,
    required this._appDatabase,
  });
  
  @override
  Future<DataState<List<ShowEntity>>> getPopularShowEntitiesFromAPI({
    String ? language,
    int ? page
  }) async {
    try {
      final showModels = await showDatasource.getPopularShows(language, page);
      final genres = await showDatasource.getTVGenres(language);

      final results = showModels.map((show) {

        final genreList = genres
            .where((g) => show.genreIds.contains(g.id))
            .map((g) => GenreModel(id: g.id, name: g.name))
            .toList();

        return ShowEntity.fromModel(show, genreList);
      }).toList();
      
      return DataSuccess(results);

    } on DioException catch (e) {
      return DataException(e);
    }
  }

  @override
  Future<DataState<List<GenreEntity>>> getTVGenresFromAPI({
    String ? language
  }) async {
    try {
      final result = await showDatasource.getTVGenres(language);

      final genreModels = result.map((genre) {
        return GenreEntity(id: genre.id, name: genre.name);
      }).toList();

      return DataSuccess(genreModels);

    } on DioException catch(e) {
      return DataException(e);
    }
  }

  @override
  Future<DataState<ShowDetailsEntity>> getShowDetailsFromAPI({
    required int showId,
    String ? language
  }) async {
    try {
      final result = await showDatasource.getShowDetailsRAW(showId, language);

      final showModel = ShowModel.fromJson(result);
      final showDetailsModel = ShowDetailsModel.fromJson(result);
      final episodeModel = EpisodeModel.fromJson(result['last_episode_to_air']);
      
      final List<dynamic> creatorsList = result['created_by'];
      final creators = creatorsList.map((creator) {
        return CreatorModel.fromJson(creator);
      }).toList();
      
      final List<dynamic> genreList = result['genres'];
      final List<GenreModel> genreNames = genreList
          .map((g) => GenreModel.fromJson(g)).toList();

      final List<dynamic> seasonList = result['seasons'];
      final seasons = seasonList
          .map((s) {
            return SeasonModel.fromJson(s, showId);
      }).toList();

      final List<dynamic> companiesList = result['production_companies'];
      final companies = companiesList
          .map((s) {
        return CompaniesModel.fromJson(s);
      }).toList();

      final List<dynamic> networksList = result['networks'];
      final networks = networksList
          .map((s) {
        return NetworksModel.fromJson(s);
      }).toList();

      final showDetails = ShowDetailsEntity.fromModels(
        showModel: showModel,
        showDetailsModel: showDetailsModel,
        genres: genreNames,
        lastEpisodeToAir: episodeModel,
        creators: creators,
        languages: result['languages'].cast<String>(),
        seasons: seasons,
        companies: companies,
        networks: networks
      );

      return DataSuccess(showDetails);
    } on DioException catch(e) {
      return DataException(e);
    }
  }

  @override
  Future<DataState<ShowDetailsEntity>> getShowDetailsFromLocal({
    required int showId
  }) async {
    try {

      final showDetailsModel = await _appDatabase.showDetailsDao.getFirstShow();

      final showModel = await _appDatabase.showDao.getShowById(showId);

      final episodeModel = await _appDatabase.episodeDao.getEpisodeById(
          showDetailsModel!.idLastEpisodeToAir!
      );

      final showCreators = await _appDatabase.showCreatorsDao.getCreatorsByShowId(showId);
      final creatorsId = showCreators.map((showCreator) => showCreator.creatorId).toList();
      final List<CreatorModel> creators = [];
      for (var id in creatorsId) {
        final creator = await _appDatabase.creatorsDao.getCreatorById(id);
        creators.add(creator!);
      }


      final showGenres = await _appDatabase.showGenresDao.getGenresByShowId(showId);
      final genresId = showGenres.map((showGenre) => showGenre.genreId).toList();
      final List<GenreModel> genres = [];
      for (var id in genresId) {
        final genre = await _appDatabase.genreDao.getGenreById(id);
        genres.add(genre!);
      }

      final showCompanies = await _appDatabase.showCompaniesDao.getCompaniesByShowId(showId);
      final companiesId = showCompanies.map((showCompany) => showCompany.companyId).toList();
      final List<CompaniesModel> companies = [];
      for (var id in companiesId) {
        final company = await _appDatabase.companiesDao.getCompanyById(id);
        companies.add(company!);
      }

      final showNetworks = await _appDatabase.showNetworksDao.getNetworkByShowId(showId);
      final networksId = showNetworks.map((showNetwork) => showNetwork.networkId).toList();
      final List<NetworksModel> networks = [];
      for (var id in networksId) {
        final network = await _appDatabase.networksDao.getNetworkById(id);
        networks.add(network!);
      }

      final seasons = await _appDatabase.seasonDao.getSeasonsByShowId(showId);


      final showDetails = ShowDetailsEntity.fromModels(
        showModel: showModel!,
        showDetailsModel: showDetailsModel,
        genres: genres,
        lastEpisodeToAir: episodeModel,
        creators: creators,
        languages: showDetailsModel.languages,
        seasons: seasons,
        companies: companies,
        networks: networks
      );

      return DataSuccess(showDetails);
    } on DioException catch(e) {
      return DataException(e);
    }
  }

  @override
  Future<DataState<List<ShowEntity>>> getShowEntitiesFromLocal() async {
    try {
      final showModels = await _appDatabase.showDao.getShows();
      final genres = await _appDatabase.genreDao.getGenres();

      final results = showModels.map((show) {

        final genreList = genres
            .where((g) => show.genreIds.contains(g.id))
            .map((g) => GenreModel(id: g.id, name: g.name))
            .toList();

        return ShowEntity.fromModel(show, genreList);
      }).toList();

      return DataSuccess(results);

    } on Exception catch (e) {
      return DataException(e);
    }
  }

  @override
  Future<void> saveShowDetails({
    required ShowDetailsEntity showDetails
  }) async {
    final episodeModel = EpisodeModel.fromEntity(showDetails.lastEpisodeToAir!);
    final showDetailsModel = ShowDetailsModel.fromEntity(showDetails);
    final creatorModels = showDetails.createdBy!.map(
            (c) => CreatorModel.fromEntity(c)).toList();
    final seasonModels = showDetails.seasons!.map(
            (s) => SeasonModel.fromEntity(s, showDetails.id)).toList();
    final companiesModels = showDetails.companies!.map(
            (c) => CompaniesModel.fromEntity(c)).toList();
    final networkModels = showDetails.networks!.map(
            (n) => NetworksModel.fromEntity(n)).toList();

    await _appDatabase.saveShowDetailsComplete(
        showDetailsModel,
        episodeModel,
        creatorModels,
        seasonModels,
        companiesModels,
        networkModels
    );
  }

  @override
  Future<void> saveShowEntity({
    required ShowEntity show
  }) async {

    final List<int> genreIds = [];
    for (var g in show.genres!) {
      await _appDatabase.genreDao.insertGenre(GenreModel.fromEntity(g));
      genreIds.add(g.id);
    }

    final showModel = ShowModel.fromEntity(show, genreIds);
    return await _appDatabase.showDao.insertShow(showModel);
  }

}