import 'package:angel_framework/angel_framework.dart';

import '../models/lookup_item.dart';
import '../services/itunes_service.dart';

class ToplistController {
  final ItunesService service;

  ToplistController(this.service);

  Future<void> getPodcastCharts(RequestContext req, ResponseContext res) async {
    final queryParameter = req.queryParameters;
    final String languageQuery = queryParameter['language'] ?? 'de';
    final String limitQuery = queryParameter['limit'] ?? '30';
    final String explicitQuery = queryParameter['explicit'] ?? 'true';
    final String genreQuery = queryParameter['genre'];

    final chartsResponse = await service.getTopPodcast(
      language: languageQuery,
      limit: int.parse(limitQuery),
      explicit: explicitQuery == 'false' ? false : true,
      genre: genreQuery ?? null,
    );

    res.serialize(chartsResponse);
  }

  Future<void> getLookup(RequestContext req, ResponseContext res) async {
    final queryParameter = req.queryParameters;
    final lookupId = queryParameter['id'];
    if (lookupId == null) throw AngelHttpException.badRequest();

    final lookupData = LookupResponseMapper.fromMap(await service.getLookup(id: lookupId));
    if (lookupData.resultCount == 0) throw AngelHttpException.badRequest();

    res.serialize(lookupData.results.first.toMap());
  }
}
