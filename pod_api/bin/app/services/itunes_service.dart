import 'dart:convert';

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
  /// - `Future<String>` the xml string
  Future<String> getTopPodcast({String language, int limit, bool explicit, String genre}) async {
    final String url = genre == null
        ? '$itunesBaseUrl${language ?? 'de'}/rss/toppodcasts/limit=${limit ?? 30}/explicit=${explicit ?? true}/xml'
        : '$itunesBaseUrl${language ?? 'de'}/rss/toppodcasts/limit=${limit ?? 30}/genre=$genre/explicit=${explicit ?? true}/xml';

    final xmlResponse = await dio.get<String>(url);
    return xmlResponse.data;
  }

  Future<Map<String, dynamic>> getLookup({@required String id}) async {
    final String url = '${itunesBaseUrl}lookup?id=$id';
    final lookupData = await dio.get<String>(url);
    return json.decode(lookupData.data);
  }
}
