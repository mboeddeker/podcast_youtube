import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class MockAdapter extends HttpClientAdapter {
  static const String mockHost = "itunes.apple.com";
  static const String mockBase = "https://itunes.apple.com/";
  static const String mockHostFeed = 'verbrechen.podigee.io';
  static const String mockFeedUrl = "https://$mockHostFeed/feed/mp3";
  DefaultHttpClientAdapter _adapter = DefaultHttpClientAdapter();

  @override
  void close({bool force = false}) {
    _adapter.close(force: force);
  }

  @override
  Future<ResponseBody> fetch(
      RequestOptions options, Stream<List<int>> requestStream, Future cancelFuture) async {
    Uri uri = options.uri;

    if (uri.host == mockHost) {
      switch (uri.path) {
        case '/test':
          return ResponseBody.fromString(jsonEncode({'testvalue': 1}), 200, headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          });

        case '/de/rss/toppodcasts/limit=10/explicit=true/xml':
          var charts = File('test_resources/charts.xml');
          var responseString = await charts.readAsString();
          return ResponseBody.fromString(responseString, 200, headers: {
            Headers.contentTypeHeader: ['application/rss+xml; charset=utf-8'],
          });

        case '/lookup':
          var lookup = File('test_resources/lookup.json');

          return ResponseBody.fromString(await lookup.readAsString(), 200, headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          });

        default:
          return ResponseBody.fromString("", 404);
      }
    } else if (uri.host == mockHostFeed) {
      var feedRss = File('test_resources/feed.rss');
      return ResponseBody.fromString(await feedRss.readAsString(), 200, headers: {
        Headers.contentTypeHeader: ['application/rss+xml; charset=utf-8'],
      });
    } else {
      return ResponseBody.fromString("", 404);
    }
  }
}
