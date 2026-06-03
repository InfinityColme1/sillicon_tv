import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sillicont_tv/features/shows/data/models/genre.dart';
import 'package:sillicont_tv/features/shows/data/models/show.dart';
import 'package:sillicont_tv/features/shows/data/models/show_details.dart';


class TmdbApiService {
  final Dio dio;

  TmdbApiService({required this.dio});

  Future<List<ShowModel>> getPopularShows(String ? language, int ? page) async {

    var result = await dio.get(
      '/3/tv/popular',
      queryParameters: {'language': language, 'page': page, 'api_key': dotenv.env['API_KEY']}
    );

    return (result.data['results'] as List)
      .map((e) => ShowModel.fromJson(e))
      .toList();
  }

  Future<List<GenreModel>> getTVGenres(String ? language) async {

    var result = await dio.get(
      '/3/genre/tv/list',
      queryParameters: {'language': language, 'api_key': dotenv.env['API_KEY']}
    );

    return (result.data['genres'] as List)
        .map((e) => GenreModel.fromJson(e))
        .toList();
  }

  Future<ShowDetailsModel> getShowDetails(
      int ? showId,
      String ? language) async {

    var result = await dio.get(
      '/3/tv/$showId',
      queryParameters: {'language': language, 'api_key': dotenv.env['API_KEY']}
    );

    return ShowDetailsModel.fromJson(result.data);
  }
}