import '../models/podcast_item.dart';
import 'base_service.dart';

class FeedService extends BaseService {
  Future<Map<String, dynamic>> getRssFeed(String feedUrl) async {
    final rssFeedString = await dio.get<String>(feedUrl);
    return PodcastFeed.fromXML(rssFeedString.data).toMap();
  }
}
