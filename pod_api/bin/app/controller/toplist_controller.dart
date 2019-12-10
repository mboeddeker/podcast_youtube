import 'package:angel_framework/angel_framework.dart';
import 'package:webfeed/webfeed.dart';

import '../services/itunes_toplist_service.dart';
import '../utils/xml_parser.dart';

class ToplistController {
  final ItunesTopListService service;
  final XMLParser _xmlParser = XMLParser();

  ToplistController(this.service);


  Future getPodcastCharts(RequestContext req, ResponseContext res) async {
    final String xmlData = await service.getTopPodcast();
  }
}
