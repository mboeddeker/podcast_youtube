import 'package:angel_framework/angel_framework.dart';
import 'package:logging/logging.dart';
import 'routes/router.dart';
import 'services/feed_service.dart';
import 'services/itunes_service.dart';

class App {
  Future<Angel> createServer() async {
    final _app = Angel();
    final router = AppRouter(ItunesService(), FeedService());

    _app.logger = Logger('example')
      ..onRecord.listen((rec) {
        print(rec);
        if (rec.error != null) print(rec.error);
        if (rec.stackTrace != null) print(rec.stackTrace);
      });

    router.addBasicRoutes(_app);
    router.connectItunesRoutesWith(_app);

    return _app;
  }
}
