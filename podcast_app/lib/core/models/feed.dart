import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:podcast_app/core/models/feed_item.dart';
import 'package:uuid/uuid.dart';

class Feed extends Equatable {
  final String _id = Uuid().v1();
  final String title;
  final String lastBuild;
  final String description;
  final String image;
  final String owner;
  final List<FeedItem> items;

  Feed({
    @required this.title,
    @required this.lastBuild,
    @required this.description,
    @required this.image,
    @required this.owner,
    @required this.items,
  });

  static Feed fromJson(Map<String, dynamic> map) {
    return Feed(
      title: map['title'],
      lastBuild: map['lastBuild'],
      description: map['description'],
      image: map['image'],
      owner: map['owner'],
      items: map['items'].map((item) => FeedItem.fromJson(item)).toList(),
    );
  }

  @override
  List<Object> get props => [_id];
}
