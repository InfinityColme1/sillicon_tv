import 'package:sillicont_tv/core/resources/data_state.dart';
import 'package:sillicont_tv/features/shows/domain/entities/show.dart';

import '../entities/genre.dart';


abstract class ShowRepository {

  Future<DataState<List<ShowEntity>>> getPopularShowEntities({
    String ? language,
    int ? page
  });

  Future<DataState<List<GenreEntity>>> getTVGenres({String ? language});
}