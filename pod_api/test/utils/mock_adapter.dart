import 'dart:convert';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class MockAdapter extends HttpClientAdapter {
  static const String mockHost = "mockserver";
  static const String mockBase = "http://$mockHost";
  DefaultHttpClientAdapter _adapter = DefaultHttpClientAdapter();

  @override
  void close({bool force = false}) {
    _adapter.close(force: force);
  }

  @override
  Future<ResponseBody> fetch(RequestOptions options,
      Stream<List<int>> requestStream, Future cancelFuture) async {
    Uri uri = options.uri;

    if (uri.host == mockHost) {
      switch (uri.path) {
        case '/test':
          return ResponseBody.fromString(
            jsonEncode({'testvalue': 1}),
            200,
            headers: {
              Headers.contentTypeHeader: [Headers.jsonContentType],
            },
          );

        case '/charts':
          return 



        default:
          return ResponseBody.fromString("", 404);
      }
    }
  }
}
