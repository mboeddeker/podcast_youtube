import 'package:dio/dio.dart';

import 'base_service.dart';

class ItunesTopListService extends BaseService {

  ItunesTopListService() : super();

  Future<String> getTopPodcast({String language = 'de', int limit = 30, bool explicit = true, String genre = null}) async {
    final String url = genre == null 
      ? '$itunesBaseUrl$language/rss/toppodcasts/limit=$limit/explicit=$explicit/xml'
      : '$itunesBaseUrl$language/rss/toppodcasts/limit=$limit/genre=$genre/explicit=$explicit/xml';

    final xmlResponse = await dio.get<String>(url);
    return xmlResponse.data;
  }
}