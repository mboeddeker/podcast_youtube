import 'package:xml/xml.dart' as xml;
import 'package:meta/meta.dart';

import 'lookup_item.dart';

class ChartsResponse {
  List<ChartItem> entries;
  ChartsResponse({this.entries});

  static ChartsResponse fromXML(String xmlString) {
    try {
      final xml.XmlDocument document = xml.parse(xmlString);

      var chartItems = document
          .findAllElements("entry")
          .map<ChartItem>((element) => ChartItem.fromXml(element))
          .toList();

      return ChartsResponse(entries: chartItems);
    } catch (err) {
      print(err);
      return ChartsResponse(entries: List());
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'entries': this.entries.map((item) => item.toMap()).toList(),
    };
  }
}

class ChartItem {
  final String id;
  final String title;
  final String summary;
  final String artist;
  final String thumbnail;
  final String releaseDate;
  final String category;
  LookupResult lookup;

  ChartItem({
    @required this.id,
    @required this.title,
    @required this.summary,
    @required this.artist,
    @required this.thumbnail,
    @required this.releaseDate,
    @required this.category,
    this.lookup,
  });

  static ChartItem fromXml(xml.XmlElement xmlNode) {
    var id = xmlNode.findAllElements('id').single.getAttribute('im:id');
    var title = xmlNode.findAllElements('title').single.text;
    var summary = xmlNode.findAllElements('summary').single.text;
    var artist = xmlNode.findAllElements('im:artist').single.text;
    var thumbnail = xmlNode.findAllElements('im:image').last.text ?? "";
    var releaseDate = xmlNode.findAllElements('im:releaseDate').single.text;
    var category =
        xmlNode.findAllElements('category').single.getAttribute('label');

    return ChartItem(
        id: id,
        title: title,
        summary: summary,
        artist: artist,
        thumbnail: thumbnail,
        releaseDate: releaseDate,
        category: category);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'summary': this.summary,
      'artist': this.artist,
      'thumbnail': this.thumbnail,
      'releaseDate': this.releaseDate,
      'category': this.category,
      'lookup': this.lookup?.toMap() ?? {},
    };
  }
}
