import 'package:sillicont_tv/core/resources/data_state.dart';
import 'package:sillicont_tv/core/usecase.dart';
import 'package:sillicont_tv/features/shows/domain/entities/show.dart';
import 'package:sillicont_tv/features/shows/domain/repository/show_repository.dart';

class GetPopularParams {
  final bool onLine;
  final String ? language;
  final int ? page;

  GetPopularParams({required this.onLine, this.language, this.page});
}

class GetPopularUseCase extends UseCase<DataState<List<ShowEntity>>, GetPopularParams> {

  final ShowRepository _showRepository;

  GetPopularUseCase({
    required this._showRepository,
  });

  @override
  Future<DataState<List<ShowEntity>>> call({GetPopularParams? params}) async {

    final remoteResults = await _showRepository.getPopularShowEntitiesFromAPI(
        language: params?.language,
        page: params?.page
    );

    if (remoteResults is DataException ||
        remoteResults.data == null ||
        !params!.onLine) {
      final localResults = await _showRepository.getShowEntitiesFromLocal();
      return localResults;
    }

    if (remoteResults is DataSuccess) {
      for (var show in remoteResults.data!) {
        await _showRepository.saveShowEntity(show: show);
      }
      return remoteResults;
    }

    return DataException(Exception("Error fetching data"));
  }
  
}