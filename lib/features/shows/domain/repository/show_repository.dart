import 'package:sillicont_tv/core/resources/data_state.dart';
import 'package:sillicont_tv/features/shows/domain/entities/show.dart';

import '../entities/genre.dart';
import '../entities/show_details.dart';


abstract class ShowRepository {

  Future<DataState<List<ShowEntity>>> getPopularShowEntities({
    String ? language,
    int ? page
  });

  Future<DataState<List<GenreEntity>>> getTVGenres({String ? language});

  Future<DataState<ShowDetailsEntity>> getShowDetails({
    int showId,
    String ? language
  });
}