import 'package:sillicont_tv/core/usecase.dart';
import 'package:sillicont_tv/features/shows/domain/repository/show_repository.dart';
import '../../../../core/resources/data_state.dart';
import '../entities/show_details.dart';


class GetShowDetailsParams {
  final int id;
  final bool onLine;
  final String language;

  GetShowDetailsParams({
    required this.id,
    required this.onLine,
    required this.language
  });
}

class GetShowDetailsUsecase extends UseCase<DataState<ShowDetailsEntity>, GetShowDetailsParams> {

  final ShowRepository _showRepository;

  GetShowDetailsUsecase({required this._showRepository});

  @override
  Future<DataState<ShowDetailsEntity>> call ({GetShowDetailsParams ? params}) async {

    final remoteResults = await _showRepository.getShowDetailsFromAPI(
        showId: params!.id,
        language: params.language
    );

    if (remoteResults is DataException ||
        remoteResults.data == null || !params!.onLine) {
      final localResults = _showRepository.getShowDetailsFromLocal(showId: params.id);
      return localResults;
    }

    if (remoteResults is DataSuccess) {
      await _showRepository.saveShowDetails(showDetails: remoteResults.data!);
      return remoteResults;
    }

    return DataException(Exception("Error fetching data"));
  }


}