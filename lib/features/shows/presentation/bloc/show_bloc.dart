import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sillicont_tv/core/resources/data_state.dart';
import 'package:sillicont_tv/features/shows/domain/usecases/get_popular.dart';
import 'package:sillicont_tv/features/shows/presentation/bloc/show_event.dart';
import 'package:sillicont_tv/features/shows/presentation/bloc/show_state.dart';

class ShowBloc extends Bloc<ShowEvent, ShowState>{

  final GetPopularUseCase _getPopularUseCase;

  ShowBloc({required this._getPopularUseCase}) : super(ShowLoading()) {
    on<GetPopularShows> (onGetPopularShows);
  }

  void onGetPopularShows(GetPopularShows event, Emitter<ShowState> emit) async {
    final dataState = await _getPopularUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(ShowSuccess(dataState.data!));
    }

    if (dataState is DataException) {
      emit(ShowException(dataState.exception!));
    }
  }
}