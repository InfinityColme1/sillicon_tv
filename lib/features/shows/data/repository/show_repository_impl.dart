import 'package:dio/dio.dart';
import 'package:sillicont_tv/core/resources/data_state.dart';
import 'package:sillicont_tv/features/shows/data/datasources/remote/tmdb_api_service.dart';
import 'package:sillicont_tv/features/shows/data/models/show.dart';
import 'package:sillicont_tv/features/shows/domain/entities/genre.dart';
import 'package:sillicont_tv/features/shows/domain/repository/show_repository.dart';


class ShowRepositoryImpl implements ShowRepository {

  final TmdbApiService showDatasource;

  ShowRepositoryImpl({required this.showDatasource});
  
  @override
  Future<DataState<List<ShowModel>>> getPopularShowEntities({
    String ? language,
    int ? page
  }) async {
    try {
      final results = await showDatasource.getPopularShows(language, page);
      
      return DataSuccess(results);

    } on DioException catch (e) {
      return DataException(e);
    }
  }

  @override
  Future<DataState<List<GenreEntity>>> getTVGenres({
    String ? language
  }) async {
    try {
      final result = await showDatasource.getTVGenres(language);

      return DataSuccess(result);

    } on DioException catch(e) {
      return DataException(e);
    }
  }

}