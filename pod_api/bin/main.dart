import 'dart:io';
import 'package:angel_framework/http.dart';

import 'app/app.dart';
import 'package:angel_hot/angel_hot.dart';

main() async {
  final App app = await App();

  var hotReloader = HotReloader(app.createServer, [new Directory('bin/app')]);
  await hotReloader.startServer('localhost', 3000);

  /* final App app = await App();
  final angelInstance = await app.createServer();

  var http = AngelHttp(angelInstance);
  await http.startServer('localhost', 3000); */
}
