import 'package:sillicont_tv/core/resources/data_state.dart';
import 'package:sillicont_tv/core/usecase.dart';
import 'package:sillicont_tv/features/shows/domain/entities/genre.dart';
import 'package:sillicont_tv/features/shows/domain/entities/show.dart';
import 'package:sillicont_tv/features/shows/domain/repository/show_repository.dart';


class GetPopularUseCase extends UseCase<DataState<List<ShowEntity>>, void> {

  final ShowRepository _showRepository;
  final String ? language;
  final int ? page;

  GetPopularUseCase({
    required this._showRepository,
    this.language,
    this.page
  });

  @override
  Future<DataState<List<ShowEntity>>> call({void params}) async {

    final results = await Future.wait([
      _showRepository.getPopularShowEntities(language: language, page: page),
      _showRepository.getTVGenres(language: language)
    ]);

    final shows = results[0].data as List<ShowEntity>;
    final tvGenres = results[1].data as List<GenreEntity>;

    final showsAndGenres = shows.map((show) {
      
      final genreNameList = tvGenres
          .where((g) => show.genreIds!.contains(g.id))
          .map((g) => g.name)
          .toList();

      return show.copyWith(genreNames: genreNameList);
    }).toList();

    return DataSuccess(showsAndGenres);
  }
  
}