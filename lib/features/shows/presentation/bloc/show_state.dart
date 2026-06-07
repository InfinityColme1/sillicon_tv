import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sillicont_tv/core/constants/constants.dart';

import 'package:sillicont_tv/features/shows/domain/entities/show.dart';

import '../../domain/entities/show_details.dart';

abstract class ShowState extends Equatable {
  final List<ShowEntity> ? showList;
  final ShowDetailsEntity? showDetails;
  final Exception ? exception;

  final bool searchOnline;
  final ThemeMode themeMode;
  final String lang;
  final int page;

  const ShowState({
    this.showList,
    this.showDetails,
    this.exception,
    this.searchOnline = true,
    this.themeMode = ThemeMode.light,
    this.lang = english,
    this.page = 1
  });

  ShowState copyWith({
    List<ShowEntity>? showList,
    ShowDetailsEntity? showDetails,
    Exception? exception,
    bool? searchOnline,
    ThemeMode? themeMode,
    String lang,
    int page,
  });

  @override
  List<Object?> get props => [
    showList,
    showDetails,
    exception,
    searchOnline,
    themeMode,
    lang,
    page
  ];

}


class ShowLoading extends ShowState {
  const ShowLoading({super.themeMode});

  @override
  ShowLoading copyWith({
    List<ShowEntity>? showList,
    ShowDetailsEntity? showDetails,
    Exception? exception,
    bool? searchOnline,
    ThemeMode? themeMode,
    String ? lang,
    int ? page,
  }) {
    return ShowLoading(themeMode: themeMode ?? this.themeMode);
  }
}

class ShowSuccess extends ShowState {
  const ShowSuccess({
    required List<ShowEntity> shows,
    required super.searchOnline,
    super.themeMode = ThemeMode.light,
    super.lang,
    super.page
  }) : super(showList: shows);

  @override
  ShowSuccess copyWith({
    List<ShowEntity>? showList,
    ShowDetailsEntity? showDetails,
    Exception? exception,
    bool? searchOnline,
    ThemeMode? themeMode,
    String ? lang,
    int ? page,
  }) {
    return ShowSuccess(
      shows: showList ?? this.showList!,
      searchOnline: searchOnline ?? this.searchOnline,
      themeMode: themeMode ?? this.themeMode,
      lang: lang ?? this.lang,
      page: page ?? this.page
    );
  }
}

class ShowException extends ShowState {
  const ShowException({
    required Exception exception,
    super.showList,
    super.showDetails,
    super.themeMode,
    super.lang,
    super.searchOnline,
    super.page
  }) : super(exception: exception);

  @override
  ShowException copyWith({
    List<ShowEntity>? showList,
    ShowDetailsEntity? showDetails,
    Exception? exception,
    bool? searchOnline,
    ThemeMode? themeMode,
    String ? lang,
    int ? page,
  }) {
    return ShowException(
        showList: showList ?? this.showList,
        showDetails: showDetails ?? this.showDetails,
        exception: exception ?? this.exception!,
        themeMode: themeMode ?? this.themeMode,
        lang: lang ?? this.lang,
        searchOnline: searchOnline ?? this.searchOnline,
        page: page ?? this.page
    );
  }
}

class ShowDetailsSuccess extends ShowState {
  const ShowDetailsSuccess({
    required ShowDetailsEntity showDetails,
    required super.searchOnline,
    super.themeMode = ThemeMode.light,
    super.lang,
    super.page
  }) : super(showDetails: showDetails);

  @override
  ShowDetailsSuccess copyWith({
    List<ShowEntity>? showList,
    ShowDetailsEntity? showDetails,
    Exception? exception,
    bool? searchOnline,
    ThemeMode? themeMode,
    String ? lang,
    int ? page,
  }) {
    return ShowDetailsSuccess(
        showDetails: showDetails ?? this.showDetails!,
        searchOnline: searchOnline ?? this.searchOnline,
        themeMode: themeMode ?? this.themeMode,
        lang: lang ?? this.lang,
        page: page ?? this.page
    );
  }
}