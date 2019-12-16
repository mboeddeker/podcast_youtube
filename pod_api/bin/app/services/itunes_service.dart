import 'dart:convert';

import '../models/chart_item.dart';
import '../models/lookup_item.dart';
import 'base_service.dart';
import 'package:meta/meta.dart';

class ItunesService {
  BaseService service;
  ItunesService(this.service);

  /// Get top podcasts from the itunes search api.
  ///
  /// Parameters:
  /// - `String language` (default `de`)
  /// - `int limit` (default `30`)
  /// - `bool explicit` (default `true`)
  /// - `String genre` (default `null`, would be the genre id)
  ///
  /// Returns:
  /// - `ChartsResponse`
  Future<ChartsResponse> getTopPodcast(
      {String language, int limit, bool explicit, String genre}) async {
    final String url = genre == null
        ? '${service.itunesBaseUrl}$language/rss/toppodcasts/limit=$limit/explicit=$explicit/xml'
        : '${service.itunesBaseUrl}$language/rss/toppodcasts/limit=$limit/genre=$genre/explicit=$explicit/xml';

    final xmlResponse = await service.dio.get<String>(url);

    var itunesCharts = ChartsResponse.fromXML(xmlResponse.data);
    for (var item in itunesCharts.entries) {
      final lookup = await getLookup(id: item.id);
      item.lookup = lookup.results.first;
    }
    return itunesCharts;
  }

  /// Maybe, you should give out the models always, to map is ore for controller or not ?
  ///

  Future<LookupResponse> getLookup({@required String id}) async {
    final String url = '${service.itunesBaseUrl}lookup?id=$id';
    final lookupData = await service.dio.get<String>(url);
    return LookupResponse.fromMap(json.decode(lookupData.data));
  }

  Future<LookupResponse> search({String seachTerm, bool explicit}) async {
    final String url =
        '${service.itunesBaseUrl}search?term=$seachTerm&country=de&media=podcast&explicit=$explicit';
    final searchData = await service.dio.get(url);
    return LookupResponse.fromMap(json.decode(searchData.data));
  }
}
