import 'package:angel_framework/angel_framework.dart';

import '../services/itunes_service.dart';
import '../utils/xml_parser.dart';

class ToplistController {
  final ItunesService service;
  final XMLParser _xmlParser = XMLParser();

  ToplistController(this.service);


  Future getPodcastCharts(RequestContext req, ResponseContext res) async {
    final String xmlData = await service.getTopPodcast();

  }
}
