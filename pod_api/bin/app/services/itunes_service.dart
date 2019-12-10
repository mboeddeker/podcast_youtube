import 'base_service.dart';
import 'package:meta/meta.dart';

class ItunesService extends BaseService {
  ItunesService() : super();

  Future<String> getTopPodcast(
      {String language = 'de', int limit = 30, bool explicit = true, String genre = null}) async {
    final String url = genre == null
        ? '$itunesBaseUrl$language/rss/toppodcasts/limit=$limit/explicit=$explicit/xml'
        : '$itunesBaseUrl$language/rss/toppodcasts/limit=$limit/genre=$genre/explicit=$explicit/xml';

    final xmlResponse = await dio.get<String>(url);
    return xmlResponse.data;
  }

  Future getLookup({@required int id}) async {
    final String url = '${itunesBaseUrl}lookup?id=$id';
    final lookupResponse = await dio.get<Map<String, dynamic>>(url);
  }
}
