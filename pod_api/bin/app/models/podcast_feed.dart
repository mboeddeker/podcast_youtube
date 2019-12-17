import 'package:webfeed/webfeed.dart';
import 'podcast_item.dart';

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
