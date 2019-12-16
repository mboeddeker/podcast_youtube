import 'package:dio/dio.dart';

class BaseService {
  /// Dio Client
  Dio dio = Dio();

  /// Itunes BaseUrl 'https://itunes.apple.com/'
  String itunesBaseUrl = 'https://itunes.apple.com/';

  BaseService();
}
