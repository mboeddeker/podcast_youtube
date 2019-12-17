import 'chart_item.dart';
import 'package:xml/xml.dart' as xml;

class ChartsResponse {
  List<ChartItem> entries;

  ChartsResponse({this.entries});

  static ChartsResponse fromXml(String xmlString) {
    try {
      final xml.XmlDocument document = xml.parse(xmlString);
      var chartItems = document
          .findAllElements('entry')
          .map<ChartItem>((element) => ChartItem.fromXml(element))
          .toList();

      return ChartsResponse(entries: chartItems);
    } catch (e) {
      print(e.toString());
      return ChartsResponse(entries: List());
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'entries': this.entries.map((item) => item.toMap()).toList(),
    };
  }
}
