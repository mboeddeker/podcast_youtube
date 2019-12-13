import 'package:webfeed/webfeed.dart';
import 'package:meta/meta.dart';

class PodcastFeed {
  final String title;
  final String lastBuild;
  final String description;
  final String image;
  final String owner;
  final List<PodcastItem> items;

  PodcastFeed({
    this.title,
    this.lastBuild,
    this.description,
    this.image,
    this.owner,
    this.items,
  });

  static PodcastFeed fromXML(String xmlString) {
    final rss = RssFeed.parse(xmlString);
    return PodcastFeed(
        title: rss.title,
        lastBuild: rss.lastBuildDate,
        description: rss.description,
        image: rss.image.url,
        owner: rss.copyright,
        items: rss.items.map((item) => PodcastItem.from(item)).toList());
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'lastBuild': lastBuild,
      'description': description,
      'image': image,
      'owner': owner,
      'items': items.map((item) => item.toMap()).toList(),
    };
  }
}

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
