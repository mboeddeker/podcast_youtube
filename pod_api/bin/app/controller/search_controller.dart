import 'package:angel_framework/angel_framework.dart';

import '../models/lookup_item.dart';
import '../services/itunes_service.dart';

class SearchController {
  final ItunesService service;

  SearchController(this.service);

  Future<void> search(RequestContext req, ResponseContext res) async {
    final String searchTerm = req.params['podcastName'];
    final String explicit = req.queryParameters['explicit'];

    if (searchTerm == null || searchTerm.isEmpty) throw AngelHttpException.badRequest();

    final Map<String, dynamic> searchData = await service.search(
      seachTerm: searchTerm,
      explicit: explicit == 'false' ? false : true,
    );

    final searchResponse = LookupResponseMapper.fromMap(searchData);

    res.serialize(searchResponse.toMap());
  }
}
