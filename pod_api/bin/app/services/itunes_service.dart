import 'dart:convert';

import '../models/chart_item.dart';
import 'base_service.dart';
import 'package:meta/meta.dart';

class ItunesService extends BaseService {
  ItunesService() : super();

  /// Get top podcasts from the itunes search api.
  ///
  /// Parameters:
  /// - `String language` (default `de`)
  /// - `int limit` (default `30`)
  /// - `bool explicit` (default `true`)
  /// - `String genre` (default `null`, would be the genre id)
  ///
  /// Returns:
  /// - `Map<String, dynamic>` the xml string
  Future<Map<String, dynamic>> getTopPodcast(
      {String language, int limit, bool explicit, String genre}) async {
    final String url = genre == null
        ? '$itunesBaseUrl$language/rss/toppodcasts/limit=$limit/explicit=$explicit/xml'
        : '$itunesBaseUrl$language/rss/toppodcasts/limit=$limit/genre=$genre/explicit=$explicit/xml';

    final xmlResponse = await dio.get<String>(url);

    return ChartsResponse.fromXML(xmlResponse.data).toMap();
  }

  Future<Map<String, dynamic>> getLookup({@required String id}) async {
    final String url = '${itunesBaseUrl}lookup?id=$id';
    final lookupData = await dio.get<String>(url);
    return json.decode(lookupData.data);
  }

  Future<Map<String, dynamic>> search({String seachTerm, bool explicit}) async {
    final String url =
        '${itunesBaseUrl}search?term=$seachTerm&country=de&media=podcast&explicit=$explicit';
    final searchData = await dio.get(url);
    return json.decode(searchData.data);
  }
}
