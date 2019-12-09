import 'package:angel_framework/angel_framework.dart';

class AppRouter {
  addBasicRoutes(Angel app) {
    app.get('/', (req,res) => res.write('Hello Again'));
  }
}