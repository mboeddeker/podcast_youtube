import 'package:xml/xml.dart' as xml;
import 'package:meta/meta.dart';

class ChartsResponse {
  List<ChartItem> entries;

  ChartsResponse({@required String xmlString}) {
    this.entries = _mapEntries(xmlString);
  }

  List<ChartItem> _mapEntries(String xmlString) {
    try {
      final xml.XmlDocument document = xml.parse(xmlString);

      var chartItems = document
          .findAllElements("entry")
          .map<ChartItem>((element) => ChartItem.fromXml(element))
          .toList();

      return chartItems;
    } catch (err) {
      print(err);
      return List<ChartItem>();
    }
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

  ChartItem({
    @required this.id,
    @required this.title,
    @required this.summary,
    @required this.artist,
    @required this.thumbnail,
    @required this.releaseDate,
    @required this.category,
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
}
