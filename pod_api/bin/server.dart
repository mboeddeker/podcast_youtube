import 'package:angel_framework/http.dart';

import 'app/app.dart';

main() async {
  final App app = await App();
  final angelInstance = await app.createServer();

  var http = AngelHttp(angelInstance);
  await http.startServer('127.0.0.1', 3000);
}
