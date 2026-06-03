import 'package:sillicont_tv/core/usecase.dart';
import 'package:sillicont_tv/features/shows/domain/repository/show_repository.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/resources/data_state.dart';
import '../entities/show_details.dart';

class GetShowDetailsUsecase extends UseCase<DataState<ShowDetailsEntity>, int> {

  final ShowRepository _showRepository;

  GetShowDetailsUsecase({required this._showRepository});

  @override
  Future<DataState<ShowDetailsEntity>> call ({int? params}) async {
    return await _showRepository.getShowDetails(showId: params ?? dummyShowId);
  }


}