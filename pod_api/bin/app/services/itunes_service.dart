import 'dart:convert';

import '../models/charts_response.dart';
import '../models/lookup_response.dart';
import 'base_service.dart';
import 'package:meta/meta.dart';

class ItunesService {
  BaseService service;

  ItunesService(this.service);

  /// Get top podcasts from the itunes search api.
  ///
  /// Parameters:
  /// - `String language` (default `de`)
  /// - `int limit` (default `30`, max: `200`)
  /// - `bool explicit` (default `true`)
  /// - `String genre` (default `null`, would be the genre id)
  ///
  /// Returns:
  /// - `ChartsResponse`
  Future<ChartsResponse> getTopPodcasts({
    String language = 'de',
    int limit = 30,
    bool explicit = true,
    String genre = null,
    bool withLookup = true,
  }) async {
    final String url = genre == null
        ? '${service.itunesBaseUrl}$language/rss/toppodcasts/limit=$limit/explicit=$explicit/xml'
        : '${service.itunesBaseUrl}$language/rss/toppodcasts/limit=$limit/genre=$genre/explicit=$explicit/xml';

    final xmlResponse = await service.dio.get<String>(url);
    var itunesCharts = ChartsResponse.fromXml(xmlResponse.data);

    if (withLookup) {
      for (var item in itunesCharts.entries) {
        final lookup = await getLookup(id: item.id);
        item.lookup = lookup.results.single;
      }
    }

    return itunesCharts;
  }

  Future<LookupResponse> getLookup({@required String id}) async {
    final String url = '${service.itunesBaseUrl}lookup?id=$id';
    final lookupData = await service.dio.get<String>(url);
    return LookupResponse.fromMap(json.decode(lookupData.data));
  }

  Future<LookupResponse> search({String seachTerm, bool explicit, String language = 'de'}) async {
    final String url =
        '${service.itunesBaseUrl}search?term=$seachTerm&country=$language&media=podcast&explicit=$explicit';
    final searchData = await service.dio.get<String>(url);
    return LookupResponse.fromMap(json.decode(searchData.data));
  }
}
