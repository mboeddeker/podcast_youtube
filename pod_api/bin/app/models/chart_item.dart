import 'package:xml/xml.dart' as xml;
import 'package:meta/meta.dart';

import 'lookup_item.dart';

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
    var thumbnail = xmlNode.findAllElements('im:image').last.text;
    var releaseDate = xmlNode.findAllElements('im:releaseDate').single.text;
    var category = xmlNode.findAllElements('category').single.getAttribute('label');

    return ChartItem(
      id: id,
      title: title,
      summary: summary,
      artist: artist,
      thumbnail: thumbnail,
      releaseDate: releaseDate,
      category: category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'summary': summary,
      'artist': artist,
      'thumbnail': thumbnail,
      'releaseDate': releaseDate,
      'category': category,
      'lookup': this.lookup?.toMap() ?? {},
    };
  }
}
