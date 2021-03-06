import 'package:angel_framework/angel_framework.dart';

import '../services/feed_service.dart';
import '../services/itunes_service.dart';

class DetailController {
  final FeedService feedService;
  final ItunesService itunesService;

  DetailController(this.feedService, this.itunesService);

  Future<void> getPodcast(RequestContext req, ResponseContext res) async {
    final String podcastId = req.params['podcastId'];

    if (podcastId == null || podcastId.isEmpty)
      throw AngelHttpException.badRequest(message: "Can't find Podcast for empty id");

    try {
      final lookupData = await itunesService.getLookup(id: podcastId);
      final feedUrl = lookupData.results.single.feedUrl;
      final podcastFeed = await feedService.getRssFeed(feedUrl);
      res.serialize(podcastFeed.toMap());
    } catch (e) {
      throw AngelHttpException.badRequest(message: 'Cant get Podcastfeed. ERROR: ${e.toString()}');
    }
  }
}
