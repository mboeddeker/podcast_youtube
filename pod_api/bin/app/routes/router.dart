import 'package:angel_framework/angel_framework.dart';

import '../controller/toplist_controller.dart';
import '../services/itunes_toplist_service.dart';

class AppRouter {

  ToplistController toplistController = ToplistController(ItunesTopListService());


  addBasicRoutes(Angel app) {
    app.get('/', (req, res) => res.write('Hello Again'));
  }

  connectTopListRoutesWith(Angel app) {
    app.get('/charts', toplistController.getPodcastCharts);
    app.get('/genres', _notImplementedHandler);
  }

  _notImplementedHandler(RequestContext<dynamic> req, ResponseContext<dynamic> res) {
    res.serialize({"error": "Route not implemented"});
  }
}
