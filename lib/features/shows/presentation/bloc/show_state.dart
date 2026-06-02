// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:sillicont_tv/features/shows/domain/entities/show.dart';

abstract class ShowState extends Equatable {
  final List<ShowEntity> ? showList;
  final DioException ? exception;

  const ShowState({this.showList, this.exception});


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