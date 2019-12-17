import 'package:angel_framework/angel_framework.dart';

import '../models/lookup_response.dart';
import '../services/itunes_service.dart';

class SearchController {
  final ItunesService itunesService;

  SearchController(this.itunesService);

  Future<void> search(RequestContext req, ResponseContext res) async {
    final String searchTerm = req.params['podcastName'];
    final String explicit = req.queryParameters['explicit'] ?? 'true';
    final String language = req.queryParameters['language'] ?? 'de';

    if (searchTerm == null || searchTerm.isEmpty)
      throw AngelHttpException.badRequest(message: 'SearchTerm is not valid');

    final LookupResponse searchData = await itunesService.search(
      seachTerm: searchTerm,
      explicit: explicit == 'false' ? false : true,
      language: language,
    );

    res.serialize(searchData.toMap());
  }
}
