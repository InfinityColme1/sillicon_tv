import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:sillicont_tv/core/api/tmdb_client.dart';
import 'package:sillicont_tv/features/shows/data/datasources/remote/tmdb_api_service.dart';
import 'package:sillicont_tv/features/shows/data/repository/show_repository_impl.dart';
import 'package:sillicont_tv/features/shows/domain/repository/show_repository.dart';
import 'package:sillicont_tv/features/shows/domain/usecases/get_popular.dart';
import 'package:sillicont_tv/features/shows/presentation/bloc/show_bloc.dart';

final getIt = GetIt.instance;


Future<void> initializeDependencies() async {

  // Client for tmdb api service
  getIt.registerSingleton<TmdbClient>(TmdbClient());

  getIt.registerSingleton<Dio>(getIt<TmdbClient>().getDio());

  // Tmdb service
  getIt.registerLazySingleton(() => TmdbApiService(dio: getIt()));



  // Repositories
  getIt.registerLazySingleton<ShowRepository>(() => ShowRepositoryImpl(showDatasource: getIt()));

  // Use cases
  getIt.registerSingleton<GetPopularUseCase>(GetPopularUseCase(showRepository: getIt()));

  // Blocs
  getIt.registerFactory(() => ShowBloc(getPopularUseCase: getIt()));
}