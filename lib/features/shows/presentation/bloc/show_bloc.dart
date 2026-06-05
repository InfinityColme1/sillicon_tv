import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sillicont_tv/core/constants/constants.dart';
import 'package:sillicont_tv/core/resources/data_state.dart';
import 'package:sillicont_tv/features/shows/domain/usecases/get_popular.dart';
import 'package:sillicont_tv/features/shows/domain/usecases/get_show_details.dart';
import 'package:sillicont_tv/features/shows/presentation/bloc/show_event.dart';
import 'package:sillicont_tv/features/shows/presentation/bloc/show_state.dart';

class ShowBloc extends Bloc<ShowEvent, ShowState>{

  final GetPopularUseCase _getPopularUseCase;
  final GetShowDetailsUsecase _getShowDetailsUsecase;

  ShowBloc({
    required this._getPopularUseCase,
    required this._getShowDetailsUsecase
  }) : super(ShowLoading()) {
    on<GetPopularShows> (onGetPopularShows);
    on<ReloadShowList> (onReloadShowList);
    on<GetShowDetails> (onGetShowDetails);
    on<ChangeSearchMode> (onChangeSearchMode);
    on<ChangeTheme> (onChangeTheme);
    on<ChangeLanguage> (onChangeLanguage);
  }

  void onGetPopularShows(GetPopularShows event, Emitter<ShowState> emit) async {

    final dataState = await _getPopularUseCase(
        params: GetPopularParams(
            onLine: event.searchOnline,
            language: event.language,
            page: state.page
        )
    );

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(ShowSuccess(
          shows: dataState.data!,
          themeMode: state.themeMode,
          searchOnline: event.searchOnline,
          lang: state.lang
      ));
    }

    if (dataState is DataException) {
      emit(ShowException(dataState.exception!, themeMode: state.themeMode,));
    }
  }

  void onReloadShowList(ReloadShowList event, Emitter<ShowState> emit) async {

    final dataState = await _getPopularUseCase(
        params: GetPopularParams(
            onLine: state.searchOnline,
            language: state.lang,
            page: 1
        )
    );

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(ShowSuccess(
        shows: dataState.data!,
        searchOnline: state.searchOnline,
        themeMode: state.themeMode,
        lang: state.lang,
      ));
    }

    if (dataState is DataException) {
      emit(ShowException(dataState.exception!, themeMode: state.themeMode,));
    }

  }

  void onGetShowDetails(
      GetShowDetails event,
      Emitter<ShowState> emit)
  async {
    final dataState = await _getShowDetailsUsecase(params: GetShowDetailsParams(
        id: event.showId,
        onLine: event.searchOnline,
        language: state.lang
    ));

    if (dataState is DataSuccess) {
      emit(ShowDetailsSuccess(
          showDetails: dataState.data!,
          themeMode: state.themeMode,
          searchOnline: event.searchOnline,
          lang: state.lang
      ));
    }

    if (dataState is DataException) {
      emit(ShowException(dataState.exception!, themeMode: state.themeMode));
    }
  }

  void onChangeSearchMode(ChangeSearchMode event, Emitter<ShowState> emit) async {
    emit(state.copyWith(
        showList: state.showList,
        showDetails: state.showDetails,
        exception: state.exception,
        searchOnline: !state.searchOnline,
        themeMode: state.themeMode
    ));
  }

  void onChangeTheme(ChangeTheme event, Emitter<ShowState> emit) {

    if (state.themeMode == ThemeMode.light) {
      emit(state.copyWith(
          themeMode: ThemeMode.dark,
          lang: state.lang
      ));
    } else {
      emit(state.copyWith(
          themeMode: ThemeMode.light,
          lang: state.lang
      ));
    }
  }

  void onChangeLanguage(ChangeLanguage event, Emitter<ShowState> emit) async {

    late String language;
    if (state.lang == english) {
      language = spanish;
    } else {
      language = english;
    }

    final dataState = await _getPopularUseCase(
        params: GetPopularParams(
            onLine: state.searchOnline,
            language: language,
            page: state.page
        )
    );

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(ShowSuccess(
          shows: dataState.data!,
          themeMode: state.themeMode,
          searchOnline: state.searchOnline,
          lang: language
      ));
    }

    if (dataState is DataException) {
      emit(ShowException(dataState.exception!, themeMode: state.themeMode,));
    }

  }
}