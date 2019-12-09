import 'package:angel_framework/angel_framework.dart';

class AppRouter {
  addBasicRoutes(Angel app) {
    app.get('/', (req, res) => res.write('Hello Again'));
  }

  connectTopListRoutesWith(Angel app) {
    app.get('/charts', _notImplementedHandler);
    app.get('/genres', _notImplementedHandler);
  }

  _notImplementedHandler(RequestContext<dynamic> req, ResponseContext<dynamic> res) {
    res.serialize({"error": "Route not implemented"});
  }
}
