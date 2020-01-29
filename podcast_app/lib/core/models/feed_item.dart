import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class FeedItem extends Equatable {
  final String _id = Uuid().v1();
  final String title;
  final String description;
  final String pubDate;
  final String link;
  final int episode;
  final String mediaUrl;

  FeedItem({
    @required this.title,
    @required this.description,
    @required this.pubDate,
    @required this.link,
    @required this.episode,
    @required this.mediaUrl,
  });

  static FeedItem fromJson(Map<String, dynamic> map) {
    return FeedItem(
      title: map['title'],
      description: map['description'],
      pubDate: map['pubDate'],
      link: map['link'],
      episode: map['episode'],
      mediaUrl: map['mediaUrl'],
    );
  }

  @override
  List<Object> get props => [_id];
}
