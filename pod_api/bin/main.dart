import 'dart:io';
import 'app/app.dart';
import 'package:angel_hot/angel_hot.dart';

main() async {
  final App app = await App();

  var hotReloader = HotReloader(app.createServer, [new Directory('bin/app')]);
  await hotReloader.startServer('localhost', 3000);
}

