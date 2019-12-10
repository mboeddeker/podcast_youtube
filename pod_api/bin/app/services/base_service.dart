import 'package:dio/dio.dart';

class BaseService {
  /// Dio Client
  final Dio dio = Dio();

  /// Itunes BaseUrl 'https://itunes.apple.com/'
  final String itunesBaseUrl = 'https://itunes.apple.com/';

  BaseService();
}