import '../models/podcast_item.dart';
import 'base_service.dart';

class FeedService {
  BaseService service;

  FeedService(this.service);

  Future<PodcastFeed> getRssFeed(String feedUrl) async {
    final rssFeedString = await service.dio.get<String>(feedUrl);
    return PodcastFeed.fromXML(rssFeedString.data);
  }
}
