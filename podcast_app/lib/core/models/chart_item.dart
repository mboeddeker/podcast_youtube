import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:podcast_app/core/utils/date_utils.dart';

class ChartItem extends Equatable {
  final String id;
  final String title;
  final String summary;
  final DateTime releaseDate;
  final String category;
  final String artist;
  final List<String> thumbnails;

  ChartItem({
    @required this.id,
    @required this.title,
    @required this.summary,
    @required this.releaseDate,
    @required this.category,
    @required this.artist,
    @required this.thumbnails,
  });

  static ChartItem fromJson(Map<String, dynamic> map) {
    return ChartItem(
      id: map['id'],
      title: map['title'],
      summary: map['summary'],
      releaseDate: DateUtils.dateFromString(
        dateString: map['releaseDate'],
        formatter: DateUtils.defaultFormat,
      ),
      category: map['category'],
      artist: map['artist'],
      thumbnails: map['thumbnails'].toList(),
    );
  }

  @override
  List<Object> get props => [id];
}
