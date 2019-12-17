import 'package:angel_framework/angel_framework.dart';

import '../controller/detail_controller.dart';
import '../controller/search_controller.dart';
import '../controller/toplist_controller.dart';
import '../services/feed_service.dart';
import '../services/itunes_service.dart';

class AppRouter {
  ItunesService itunesService;
  FeedService feedService;
  TopListController topListController;
  SearchController searchController;
  DetailController detailController;

  AppRouter(this.itunesService, this.feedService) {
    topListController = TopListController(itunesService);
    searchController = SearchController(itunesService);
    detailController = DetailController(feedService, itunesService);
  }

  addBasicRoutes(Angel app) {
    app.get('/', (req, res) => res.write('Hello Again'));
  }

  connectItunesRoutesWith(Angel app) {
    app.get('/charts', topListController.getPodcastCharts);
    app.get('/lookup/:podcastId', topListController.getLookup);
    app.get('/search/:podcastName', searchController.search);
    app.get('/podcast/:podcastId', detailController.getPodcast);
  }
}
