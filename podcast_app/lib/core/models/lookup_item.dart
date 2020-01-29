import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class LookupItem extends Equatable {
  final String trackId;
  final String artistName;
  final String trackName;
  final String feedUrl;
  final String artwork100;
  final String artwork600;
  final String releaseDate;
  final List<String> genres;
  final List<String> genreIds;

  LookupItem({
    @required this.trackId,
    @required this.artistName,
    @required this.trackName,
    @required this.feedUrl,
    @required this.artwork100,
    @required this.artwork600,
    @required this.releaseDate,
    @required this.genres,
    @required this.genreIds,
  });

  static LookupItem fromJson(Map<String, dynamic> map) {
    return LookupItem(
      trackId: map['trackId'],
      artistName: map['artistName'],
      trackName: map['trackName'],
      feedUrl: map['feedUrl'],
      artwork100: map['artwork100'],
      artwork600: map['artwork600'],
      releaseDate: map['releaseDate'],
      genres: map['genres'].map<String>((i) => i.toString()).toList(),
      genreIds: map['genreIds'].map<String>((i) => i.toString()).toList(),
    );
  }

  @override
  List<Object> get props => [trackId];
}
