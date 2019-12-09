import 'package:angel_framework/angel_framework.dart';

import 'routes/router.dart';

class App {

  Future<Angel> createServer() async {
    final _app = Angel();
    final router = AppRouter();

    router.addBasicRoutes(_app);
  
    
    return _app;
  }
}