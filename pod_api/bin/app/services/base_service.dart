import 'package:dio/dio.dart';

class BaseService {
  /// Dio Http Client
  Dio dio = Dio();

  /// Itunes Base Url `https://itunes.apple.com/`
  String itunesBaseUrl = 'https://itunes.apple.com/';
}
