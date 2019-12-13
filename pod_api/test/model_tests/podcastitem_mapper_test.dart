import 'package:test/test.dart';
import 'package:xml/xml.dart' as xml;
import 'package:webfeed/webfeed.dart';
import '../../bin/app/models/podcast_item.dart';
import 'dart:io';
import 'dart:convert';

void main() {
  RssFeed dto;

  setUp(() async {
    final file = File('test_resources/feed.rss');

    dto = RssFeed.parse(await file.readAsString());
  });

  tearDown(() {
    dto = null;
  });

  test('Parse LookupResponse from Json', () {
    final title = dto.title;
    final items = dto.items;
  });
}
