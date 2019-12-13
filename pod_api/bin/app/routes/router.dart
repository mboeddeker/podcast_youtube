import 'package:angel_framework/angel_framework.dart';

import '../controller/search_controller.dart';
import '../controller/toplist_controller.dart';
import '../services/itunes_service.dart';

class AppRouter {
  ItunesService service;
  ToplistController toplistController;
  SearchController searchController;

  AppRouter(ItunesService service) {
    this.toplistController = ToplistController(service);
    this.searchController = SearchController(service);
  }

  addBasicRoutes(Angel app) {
    app.get('/', (req, res) => res.write('Hello Again'));
  }

  connectItunesRoutesWith(Angel app) {
    app.get('/charts', toplistController.getPodcastCharts);
    app.get('/lookup', toplistController.getLookup);
    app.get('/search/:podcastName', searchController.search);
  }

  _notImplementedHandler(RequestContext<dynamic> req, ResponseContext<dynamic> res) {
    res.serialize({"error": "Route not implemented"});
  }
}
