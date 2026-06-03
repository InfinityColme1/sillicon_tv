import 'package:dio/dio.dart';
import 'package:sillicont_tv/core/constants/constants.dart';


class TmdbClient {

  late final Dio _dio;

  TmdbClient() : _dio = Dio();
  
  Dio getDio()  {
    _dio.options.baseUrl = tmdbApiBaseURL;
    _dio.options.headers['Host'] = tmdbApiHost;
    return _dio;
  }

}