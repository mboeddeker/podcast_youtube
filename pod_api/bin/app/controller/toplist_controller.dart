import 'package:angel_framework/angel_framework.dart';

import '../models/chart_item.dart';
import '../services/itunes_service.dart';

class ToplistController {
  final ItunesService service;

  ToplistController(this.service);

  Future<void> getPodcastCharts(RequestContext req, ResponseContext res) async {
    //TODO: Take Request Queries
    final String xmlData = await service.getTopPodcast();

    res.serialize(ChartsResponseMapper.fromXML(xmlData).toMap());
  }
}
