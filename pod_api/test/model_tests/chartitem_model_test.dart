import 'dart:io';

import 'package:test/test.dart';
import 'package:xml/xml.dart' as xml;
import '../../bin/app/models/chart_item.dart';

void main() {
  xml.XmlDocument document;

  setUp(() async {
    final File file = File('test_resources/charts.xml');
    document = xml.parse(await file.readAsString());
  });

  tearDown(() {
    document = null;
  });

  test('Test xml parsing to ChartItem', () {
    expect(document, isNotNull);

    var entries = document.findAllElements("entry");
    expect(entries.length, isNot(0));

    var chartItems = entries
        .map<ChartItem>((element) => ChartItemMapper.fromXml(element))
        .toList();

    var firstItem = chartItems.first;

    expect(firstItem, isNotNull);

    expect(firstItem.title, equals('Unter Pfarrerstöchtern - ZEIT ONLINE'));
    expect(firstItem.category, equals('Religion und Spiritualität'));
    expect(firstItem.artist, equals('ZEIT ONLINE'));
    expect(firstItem.releaseDate, equals('2019-12-05T22:30:00-07:00'));
    expect(firstItem.id, equals('1489988353'));
    expect(
        firstItem.thumbnail,
        equals(
            'https://is1-ssl.mzstatic.com/image/thumb/Podcasts113/v4/71/a6/97/71a69737-3a89-453a-dca8-ca088e7a7736/mza_6770475896512430452.png/170x170bb.png'));
  });

  test('Test xml Parsing to ChartResponse', () async {
    final File file = File('test_resources/charts.xml');
    final String xmlString = await file.readAsString();

    final sut = ChartsResponseMapper.fromXML(xmlString);
    expect(sut.entries.length, isNot(0));
    expect(sut.entries.first.title,
        equals('Unter Pfarrerstöchtern - ZEIT ONLINE'));
  });
}
