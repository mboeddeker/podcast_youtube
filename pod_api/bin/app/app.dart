import 'package:angel_framework/angel_framework.dart';
import 'package:logging/logging.dart';
import 'routes/router.dart';
import 'services/base_service.dart';
import 'services/feed_service.dart';
import 'services/itunes_service.dart';

class App {
  BaseService baseService = BaseService();

  Future<Angel> createServer() async {
    final _app = Angel();
    final router = AppRouter(ItunesService(baseService), FeedService(baseService));

    _app.logger = Logger('pod_api_logger')
      ..onRecord.listen((record) {
        print(record);
        if (record.error != null) print(record.error);
        if (record.stackTrace != null) print(record.stackTrace);
      });

    router.addBasicRoutes(_app);

    router.connectItunesRoutesWith(_app);

    return _app;
  }
}
