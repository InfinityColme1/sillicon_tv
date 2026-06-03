import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:sillicont_tv/features/shows/domain/entities/show.dart';

import '../../domain/entities/show_details.dart';

abstract class ShowState extends Equatable {
  final List<ShowEntity> ? showList;
  final ShowDetailsEntity? showDetails;
  final DioException ? exception;

  const ShowState({this.showList, this.showDetails, this.exception});


  @override
  List<Object> get props => [showList!, exception!];
}


class ShowLoading extends ShowState {
  const ShowLoading();
}

class ShowSuccess extends ShowState {
  const ShowSuccess(List<ShowEntity> shows) : super(showList: shows);
}

class ShowException extends ShowState {
  const ShowException(DioException exception) : super(exception: exception);
}

class ShowDetailsSuccess extends ShowState {
  const ShowDetailsSuccess(ShowDetailsEntity showDetails) : super(showDetails: showDetails);
}