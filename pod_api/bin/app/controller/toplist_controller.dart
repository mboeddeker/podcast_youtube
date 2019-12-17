import 'package:angel_framework/angel_framework.dart';

import '../services/itunes_service.dart';

class TopListController {
  final ItunesService itunesService;

  TopListController(this.itunesService);

  Future<void> getPodcastCharts(RequestContext req, ResponseContext res) async {
    final queryParameter = req.queryParameters;
    final String languageQuery = queryParameter['language'] ?? 'de';
    final String limitQuery = queryParameter['limit'] ?? '30';
    final String explicitQuery = queryParameter['explicit'] ?? 'true';
    final String genreQuery = queryParameter['genre'];
    final String withLookuQuery = queryParameter['lookup'] ?? 'true';

    final chartsResponse = await itunesService.getTopPodcasts(
      language: languageQuery,
      limit: int.parse(limitQuery),
      explicit: explicitQuery == 'false' ? false : true,
      genre: genreQuery ?? null,
      withLookup: withLookuQuery == 'false' ? false : true,
    );

    res.serialize(chartsResponse.toMap());
  }

  Future<void> getLookup(RequestContext req, ResponseContext res) async {
    final urlParameter = req.params;
    final lookupId = urlParameter['podcastId'];
    if (lookupId == null) throw AngelHttpException.badRequest(message: 'cant get lookup id');
    try {
      final lookupData = await itunesService.getLookup(id: lookupId);
      if (lookupData.resultCount != 1)
        throw AngelHttpException.badRequest(message: 'no results found or too many');

      res.serialize(lookupData.results.first.toMap());
    } catch (e) {
      throw AngelHttpException.badRequest(
          message: 'no results found or too many. ERROR: ${e.toString()}');
    }
  }
}
