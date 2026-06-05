import 'package:sillicont_tv/core/resources/data_state.dart';
import 'package:sillicont_tv/features/shows/domain/entities/show.dart';

import '../entities/genre.dart';
import '../entities/show_details.dart';


abstract class ShowRepository {

  Future<DataState<List<ShowEntity>>> getPopularShowEntitiesFromAPI({
    String ? language,
    int ? page
  });

  Future<DataState<List<GenreEntity>>> getTVGenresFromAPI({String ? language});

  Future<DataState<ShowDetailsEntity>> getShowDetailsFromAPI({
    required int showId,
    String ? language
  });

  Future<void> saveShowEntity({required ShowEntity show});

  Future<DataState<List<ShowEntity>>> getShowEntitiesFromLocal();


  Future<void> saveShowDetails({required ShowDetailsEntity showDetails});

  Future<DataState<ShowDetailsEntity>> getShowDetailsFromLocal({required int showId});
}