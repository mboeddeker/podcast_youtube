import 'package:meta/meta.dart';
import 'package:webfeed/webfeed.dart';

class PodcastItem {
  final String guid;
  final String title;
  final String description;
  final String mediaUrl;

  PodcastItem({
    @required this.guid,
    @required this.title,
    @required this.description,
    @required this.mediaUrl,
  });

  static PodcastItem from(RssItem item) {
    return PodcastItem(
      guid: item.guid,
      title: item.title,
      description: item.description,
      mediaUrl: item.enclosure.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'guid': guid,
      'title': title,
      'description': description,
      'mediaUrl': mediaUrl,
    };
  }
}
